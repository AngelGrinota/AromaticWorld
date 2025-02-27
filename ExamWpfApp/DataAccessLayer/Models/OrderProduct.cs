﻿using System;
using System.Collections.Generic;

namespace DataAccessLayer.Models;

public partial class OrderProduct
{
    public int OrderId { get; set; }

    public string ProductArticleNumber { get; set; } = null!;

    public int Quantity { get; set; }

    public virtual Order Order { get; set; } = null!;

    public virtual Product ProductArticleNumberNavigation { get; set; } = null!;
}
