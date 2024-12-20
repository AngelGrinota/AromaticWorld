using DataAccessLayer.Data;
using DataAccessLayer.Models;
using Microsoft.EntityFrameworkCore;

namespace ExamWpfApp.Services
{
    public class OrderService
    {
        private readonly AromaticWorldContext _context;

        public OrderService(AromaticWorldContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<Order>> GetOrdersAsync() => await _context.Orders.ToListAsync();

        public async Task<Order>? GetOrderByIdAsync(int id) => await _context.Orders
            .Include(o => o.StatusOrder)
            .Include(o => o.User)
            .Where(o => o.OrderId == id)
            .FirstOrDefaultAsync();

        public async Task UpdateOrderByIdAsync(int id, DateTime deliveryDate, string status)
        {
            var order = await _context.Orders
            .Include(o => o.StatusOrder)
            .FirstOrDefaultAsync(o => o.OrderId == id);

            if (order != null)
            {
                order.OrderDeliveryDate = deliveryDate;

                var statusOrder = await _context.StatusOrders
                    .FirstOrDefaultAsync(s => s.StatusOrderName == status);

                order.StatusOrderId = statusOrder.StatusOrderId;

                await _context.SaveChangesAsync();
            }
        }
    }
}
