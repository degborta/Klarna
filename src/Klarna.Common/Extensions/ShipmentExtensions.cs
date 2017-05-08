using System.Linq;
using EPiServer.Commerce.Order;
using Klarna.Common.Helpers;
using Klarna.Common.Models;

namespace Klarna.Common.Extensions
{
    public static class ShipmentExtensions
    {
        public static PatchedOrderLine GetOrderLine(this IShipment shipment, OrderGroupTotals totals)
        {
            var shipmentOrderLine = new PatchedOrderLine
            {
                Name = shipment.ShippingMethodName,
                Quantity = 1,
                UnitPrice = AmountHelper.GetAmount(totals.ShippingTotal.Amount),
                TotalAmount = AmountHelper.GetAmount(totals.ShippingTotal.Amount),
                Type = "shipping_fee"
            };
            if (string.IsNullOrEmpty(shipmentOrderLine.Name))
            {
                var shipmentMethod = Mediachase.Commerce.Orders.Managers.ShippingManager.GetShippingMethod(shipment.ShippingMethodId)
                    .ShippingMethod.FirstOrDefault();
                if (shipmentMethod != null)
                {
                    shipmentOrderLine.Name = shipmentMethod.DisplayName;
                }
            }
            return shipmentOrderLine;
        }
    }
}