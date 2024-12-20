using DataAccessLayer.Data;
using DataAccessLayer.Models;
using Microsoft.EntityFrameworkCore;

namespace ExamWpfApp.Services
{
    public class StatusOrderService
    {
        private readonly AromaticWorldContext _context;

        public StatusOrderService(AromaticWorldContext context)
        {
            _context = context;
        }
        public async Task<IEnumerable<StatusOrder>> GetStatusOrdersAsync() => await _context.StatusOrders.ToListAsync();
    }
}
