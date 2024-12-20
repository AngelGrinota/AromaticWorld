using ExamWpfApp.Pages;
using System.Windows;

namespace ExamWpfApp
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        
        public MainWindow()
        {
            InitializeComponent();
            
            ManagerNav.mainFrame = MainFrame;
            ManagerNav.mainFrame.Navigate(new StorePage());
        }
    }
}