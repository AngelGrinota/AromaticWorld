using DataAccessLayer.Data;
using DataAccessLayer.Models;
using ExamWpfApp.Services;
using System.Windows;
using System.Windows.Controls;

namespace ExamWpfApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для MainPage.xaml
    /// </summary>
    public partial class StorePage : Page
    {
        private ProductService _productService;
        private ManufacturerService _manufacturerService;
        private OrderService _orderService;
        private StatusOrderService _statusOrderService;

        private IEnumerable<Product>? _allProducts;
        public StorePage()
        {
            InitializeComponent();
            Style = (Style)FindResource(typeof(Page));

            _productService = new ProductService(new AromaticWorldContext());
            _manufacturerService = new ManufacturerService(new AromaticWorldContext());
            _orderService = new OrderService(new AromaticWorldContext());
            _statusOrderService = new StatusOrderService(new AromaticWorldContext());

        }
        private async void StorePage_Loaded(object sender, RoutedEventArgs e)
        {
            await LoadProductsAsync();
            await LoadManufacturers();
            await LoadStatusOrderAsync();
            await LoadOrdersIdAsync();

            FilterComboBox.SelectedIndex = 0;
            SortComboBox.SelectedIndex = 0;
            DeliveryDatePicker.Text = DateTime.Now.ToString();

            if (UserSession.CurrentUser != null)
            {
                UserLabel.Content = $"ФИО: {UserSession.CurrentUser.UserSurname} {UserSession.CurrentUser.UserName} {UserSession.CurrentUser.UserPatronymic}";
                SignOutButton.Visibility = Visibility.Visible;

                if (UserSession.CurrentUser.RoleId == 1 || UserSession.CurrentUser.RoleId == 3)
                {
                    OrdersEditTabItem.Visibility = Visibility.Visible;
                }
            }
            else
            {
                SignOutButton.Visibility = Visibility.Collapsed;
            }
        }
        public async Task LoadProductsAsync()
        {
            try
            {
                _allProducts = await _productService.GetProductsAsync();
                Filter();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка при загрузке продуктов: {ex.Message}");
            }
        }
        private void Filter()
        {
            try
            {
                var products = _allProducts;
                int totalProductsCount = _allProducts.Count();

                if (FilterComboBox.SelectedItem is string selectedManufacturer)
                {
                    if (selectedManufacturer != "Все производители")
                        products = products.Where(p => p.Manufacturer.ManufacturerName == selectedManufacturer);
                }

                if (decimal.TryParse(MinPriceTextBox.Text, out decimal minPrice) && 
                    decimal.TryParse(MaxPriceTextBox.Text, out decimal maxPrice))
                {
                    products = products.Where(p => p.ProductCost >= minPrice && p.ProductCost <= maxPrice);
                }

                var searchText = SearchTextBox.Text.ToLower();
                products = products.Where(p => p.ProductName.ToLower().Contains(searchText));

                if (SortComboBox.SelectedItem is ComboBoxItem selectedSort)
                {
                    if (selectedSort.Content.ToString() == "Сортировка по возрастанию")
                        products = products.OrderBy(p => p.ProductCost);
                    else if (selectedSort.Content.ToString() == "Сортировка по убыванию")
                        products = products.OrderByDescending(p => p.ProductCost);
                }

                List<Product> filteredProducts = products.ToList();
                ProductListBox.ItemsSource = filteredProducts;

                CountLabel.Content = $"{filteredProducts.Count} из {totalProductsCount}";
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка при применении фильтра: {ex.Message}");
            }
        }
        public async Task LoadManufacturers()
        {
            try
            {
                var manufacturers = await _manufacturerService.GetManufacturersAsync();
                foreach (var manufacturer in manufacturers)
                    FilterComboBox.Items.Add(manufacturer.ManufacturerName);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка при загрузке производителей: {ex.Message}");
            }
        }
        private void SignInButton_Click(object sender, RoutedEventArgs e)
        {
            if (UserSession.CurrentUser != null)
                MessageBox.Show("Вы уже авторизованы!");
            else
                ManagerNav.mainFrame.Navigate(new AuthPage());
        }
        private void SignOutButton_Click(object sender, RoutedEventArgs e)
        {
            UserSession.CurrentUser = null;
            ManagerNav.mainFrame.Navigate(new StorePage());
        }
        private async void UpdateDeliveryDateButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                await _orderService.UpdateOrderByIdAsync(OrderIdComboBox.SelectedIndex + 1, DeliveryDatePicker.SelectedDate.Value, StatusComboBox.SelectedItem.ToString());
                await LoadOrderById();
            }
            catch
            {
                MessageBox.Show($"Ошибка при обновлении заказа");
            }
        }
        private async Task LoadStatusOrderAsync()
        {
            var statuses = await _statusOrderService.GetStatusOrdersAsync();
            if (statuses != null && statuses.Any())
            {
                foreach (var status in statuses)
                {
                    StatusComboBox.Items.Add(status.StatusOrderName);
                    StatusComboBox.SelectedIndex = 0;
                }
            }
        }
        public async Task LoadOrdersIdAsync()
        {
            var orders = await _orderService.GetOrdersAsync();
            if (orders != null && orders.Any())
            {
                foreach (var order in orders)
                {
                    OrderIdComboBox.Items.Add(order.OrderId);
                    OrderIdComboBox.SelectedIndex = 0;
                }
            }
        }
        public async Task LoadOrderById()
        {
            OrderEditListBox.Items.Clear();

            var order = await _orderService.GetOrderByIdAsync(OrderIdComboBox.SelectedIndex + 1);
            if (order != null)
            {
                if (order.User == null)
                {
                    CustomerFullNameTextBlock.Text = "Проходимец";
                }
                else
                {
                    CustomerFullNameTextBlock.Text = $"{order.User.UserSurname} {order.User.UserName} {order.User.UserPatronymic}";
                }
                StatusComboBox.SelectedIndex = order.StatusOrderId - 1;
                DeliveryDatePicker.Text = order.OrderDeliveryDate.ToString();
                OrderEditListBox.Items.Add(order);
            }
            else
            {
                MessageBox.Show("Заказ не найден.");
            }
        }
        private async void OrderIdComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            try
            {
                OrderEditListBox.Items.Clear();
                await LoadOrderById();

            }
            catch (Exception ex)
            {
                MessageBox.Show($"{ex.Message}");
            }
        }
        private void SortComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Filter();
        }
        private void FilterComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Filter();
        }
        private void SearchTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            Filter();
        }
        private void MinPriceTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            Filter();
        }
        private void MaxPriceTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            Filter();
        }
        private void OrderButton_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
