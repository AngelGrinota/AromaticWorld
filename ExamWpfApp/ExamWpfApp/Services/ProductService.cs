using DataAccessLayer.Data;
using DataAccessLayer.Models;
using Microsoft.EntityFrameworkCore;

namespace ExamWpfApp.Services
{
    public class ProductService
    {
        private readonly AromaticWorldContext _context;

        public ProductService(AromaticWorldContext context)
        {
            _context = context;
        }
        public async Task<IEnumerable<Product>?> GetProductsAsync() => await _context.Products
            .Include(p => p.Manufacturer)
            .ToListAsync();
    }
}
