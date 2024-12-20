using System;
using System.Collections.Generic;

namespace DataAccessLayer.Models;

public partial class StatusProduct
{
    public byte StatusProductId { get; set; }

    public string StatusProductName { get; set; } = null!;

    public virtual ICollection<Product> Products { get; set; } = new List<Product>();
}
