﻿using System.Threading.Tasks;
using EPiServer.Commerce.Order;
using Klarna.Checkout.Models;
using Klarna.Common;
using Klarna.Rest.Models;
using Mediachase.Commerce;

namespace Klarna.Checkout
{
    public interface IKlarnaCheckoutService : IKlarnaService
    {
        CheckoutOrderData CreateOrUpdateOrder(ICart cart);
        CheckoutOrderData CreateOrder(ICart cart);
        CheckoutOrderData UpdateOrder(string orderId, ICart cart);

        CheckoutOrderData GetOrder(string klarnaOrderId, IMarket market);

        ICart GetCartByKlarnaOrderId(int orderGroupId, string orderId);

        ShippingOptionUpdateResponse UpdateShippingMethod(ICart cart, ShippingOptionUpdateRequest shippingOptionUpdateRequest);

        AddressUpdateResponse UpdateAddress(ICart cart, AddressUpdateRequest addressUpdateRequest);

        void CancelOrder(ICart cart);

        bool ValidateOrder(ICart cart, PatchedCheckoutOrderData checkoutData);

        void UpdateMerchantReference1(IPurchaseOrder purchaseOrder);
        void AcknowledgeOrder(IPurchaseOrder purchaseOrder);
        CheckoutConfiguration GetConfiguration(IMarket market);
        CheckoutConfiguration GetConfiguration(MarketId marketId);

        void Complete(IPurchaseOrder purchaseOrder);
    }
}