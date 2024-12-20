using DataAccessLayer.Data;
using DataAccessLayer.Models;
using Microsoft.EntityFrameworkCore;

namespace ExamWpfApp.Services
{
    public class ManufacturerService
    {
        private readonly AromaticWorldContext _context;

        public ManufacturerService(AromaticWorldContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<Manufacturer>> GetManufacturersAsync()
        {
            return await _context.Manufacturers.ToListAsync();
        }
    }
}
