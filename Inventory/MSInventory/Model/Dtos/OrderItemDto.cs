using System;

namespace MSInventory.Model.Dtos
{
    public class OrderItemDto
    {

        public OrderItemDto()
        {

        }
        public OrderItemDto(OrderItem orderItem)
        {
            OrderItemId = orderItem.Id;
            OrderId = orderItem.OrderId;
            OrderNumber = orderItem.Order.OrderNumber;
        }

        public Guid OrderItemId { get; set; }
        public Guid OrderId { get; set; }
        public string OrderNumber { get; set; }

    }
}
