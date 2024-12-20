using System;
using System.Collections.Generic;

namespace DataAccessLayer.Models;

public partial class Order
{
    public int OrderId { get; set; }

    public DateTime OrderDate { get; set; }

    public DateTime OrderDeliveryDate { get; set; }

    public int PickUpPointId { get; set; }

    public int? UserId { get; set; }

    public int ReceiveCode { get; set; }

    public int StatusOrderId { get; set; }

    public virtual ICollection<OrderProduct> OrderProducts { get; set; } = new List<OrderProduct>();

    public virtual PickUpPoint PickUpPoint { get; set; } = null!;

    public virtual StatusOrder StatusOrder { get; set; } = null!;

    public virtual User? User { get; set; }
}
