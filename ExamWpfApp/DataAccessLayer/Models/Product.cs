using System;
using System.Collections.Generic;

namespace DataAccessLayer.Models;

public partial class Product
{
    public string ProductArticleNumber { get; set; } = null!;

    public string ProductName { get; set; } = null!;

    public string ProductDescription { get; set; } = null!;

    public int CategoryId { get; set; }

    public string? ProductPhoto { get; set; }

    public int ManufacturerId { get; set; }

    public decimal ProductCost { get; set; }

    public byte ProductDiscountAmount { get; set; }

    public int ProductQuantityInStock { get; set; }

    public byte StatusProductId { get; set; }

    public virtual Category Category { get; set; } = null!;

    public virtual Manufacturer Manufacturer { get; set; } = null!;

    public virtual ICollection<OrderProduct> OrderProducts { get; set; } = new List<OrderProduct>();

    public virtual StatusProduct StatusProduct { get; set; } = null!;
}
