using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CSBusiness;

namespace CSWebBase
{
    public class SkuSortComparer : IComparer<Sku>
    {
        int IComparer<Sku>.Compare(Sku x, Sku y)
        {
            if (!x.AttributeValuesLoaded)
                x.LoadAttributeValues();

            if (!y.AttributeValuesLoaded)
                y.LoadAttributeValues();

            bool xYes = x.ContainsAttribute("Order");
            bool yYes = y.ContainsAttribute("Order");

            if (!xYes && !yYes)
                return 0;

            if (xYes && !yYes)
                return -1;

            if (!xYes && yYes)
                return 1;

            int xOrder = x.GetAttributeValue<int>("Order");
            int yOrder = y.GetAttributeValue<int>("Order");

            return xOrder.CompareTo(xOrder);
        }
    }
}
