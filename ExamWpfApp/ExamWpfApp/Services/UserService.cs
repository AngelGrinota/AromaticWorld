using DataAccessLayer.Data;
using DataAccessLayer.Models;
using Microsoft.EntityFrameworkCore;

namespace ExamWpfApp.Services
{
    public class UserService
    {
        private readonly AromaticWorldContext _context;

        public UserService(AromaticWorldContext context)
        {
            _context = context;
        }

        public async Task<User>? GetUserAsync(string login, string password)
        {
            return await _context.Users.Where(u => u.Login == login && u.Password == password).FirstAsync();
        }
    }
}
