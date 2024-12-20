using System;
using System.Collections.Generic;

namespace DataAccessLayer.Models;

public partial class PickUpPoint
{
    public int PickUpPointId { get; set; }

    public string PostalCode { get; set; } = null!;

    public string City { get; set; } = null!;

    public string Street { get; set; } = null!;

    public int? HouseNumber { get; set; }

    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();
}
