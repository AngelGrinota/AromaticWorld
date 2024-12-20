using DataAccessLayer.Data;
using ExamWpfApp.Services;
using System.Windows;
using System.Windows.Controls;

namespace ExamWpfApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для AuthPage.xaml
    /// </summary>
    public partial class AuthPage : Page
    {
        private readonly UserService _userService;
        public AuthPage()
        {
            InitializeComponent();
            Style = (Style)FindResource(typeof(Page));

            _userService = new UserService(new AromaticWorldContext());
        }

        private async void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var user = await _userService.GetUserAsync(LoginTextBox.Text, PasswordBox.Password.ToString());

                if (user != null)
                {
                    UserSession.CurrentUser = user;
                    ManagerNav.mainFrame.Navigate(new StorePage());
                }
            }
            catch
            {
                MessageBox.Show("Неверный логин или пароль");
            }
        }
    }
}
