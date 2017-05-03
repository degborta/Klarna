﻿using System;
using System.Linq;
using EPiServer.Commerce.Order;
using EPiServer.ServiceLocation;
using Klarna.Common;
using Mediachase.Commerce.Orders.Managers;
using Mediachase.Web.Console.Common;
using Newtonsoft.Json;

namespace Klarna.OrderManagement
{
    public partial class KlarnaPaymentControl : System.Web.UI.UserControl
    {
        public Guid EntityId
        {
            get
            {
                Guid empty = Guid.Empty;
                if (base.Request["ObjectId"] != null)
                {
                    empty = new Guid(base.Request["ObjectId"]);
                }
                return empty;
            }
        }

        protected int OrderGroupId
        {
            get
            {
                return ManagementHelper.GetIntFromQueryString("id");
            }
        }

        private Injected<IOrderRepository> _orderRepository;
        private Injected<ConnectionFactory> _connectionFactory;

        protected void Page_Load(object sender, EventArgs e)
        {
            var purchaseOrder = _orderRepository.Service.Load<IPurchaseOrder>(OrderGroupId);
            if (purchaseOrder != null)
            {
                var firstPayment = purchaseOrder.GetFirstForm().Payments.FirstOrDefault();
                if (firstPayment != null)
                {
                    var paymentMethod = PaymentManager.GetPaymentMethod(firstPayment.PaymentMethodId);
                    if (paymentMethod != null)
                    {
                        if (purchaseOrder.GetFirstForm().Payments.Any(x =>x.PaymentMethodId == paymentMethod.PaymentMethod.FirstOrDefault()?.PaymentMethodId))
                        {

                            var klarnaOrderService = new KlarnaOrderService(_connectionFactory.Service.GetConnectionConfiguration(paymentMethod));

                            var orderId = purchaseOrder.Properties[Constants.KlarnaOrderIdField]?.ToString();

                            var orderData = klarnaOrderService.GetOrder(orderId);

                            OrderIdLabel.Text = orderData.OrderId;
                            KlarnaReferenceLabel.Text = orderData.KlarnaReference;
                            MerchantReference1Label.Text = orderData.MerchantReference1;
                            MerchantReference2Label.Text = orderData.MerchantReference2;
                            ExpiresAtLabel.Text = orderData.ExpiresAt.ToLongDateString();
                            StatusLabel.Text = orderData.Status;
                            OrderAmountLabel.Text = GetAmount(orderData.OrderAmount);
                            CapturedAmountLabel.Text = GetAmount(orderData.CapturedAmount);
                            RefundedAmountLabel.Text = GetAmount(orderData.RefundedAmount);

                            preLabel.InnerText = JsonConvert.SerializeObject(orderData, Formatting.Indented);
                        }
                        else
                        {
                            Visible = false;
                        }
                    }
                }
            }
        }

        private string GetAmount(int? amount)
        {
            return amount.HasValue ? ((decimal)amount.Value / 100).ToString("#.##") : string.Empty;
        }
    }
}