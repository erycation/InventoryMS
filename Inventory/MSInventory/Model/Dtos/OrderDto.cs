using System;

namespace MSInventory.Model.Dtos
{
    public class OrderDto
    {

        public OrderDto()
        {

        }
        public OrderDto(Order order)
        {
            OrderId = order.Id;
            DateInserted = order.DateInserted;
            CustomerId = order.CustomerId;
            CustomerName = $"{order?.Customer?.FirstName} {order?.Customer?.Surname}";
            OrderNumber = order.OrderNumber;
        }

        public Guid OrderId { get; set; }
        public DateTime DateInserted { get; set; }
        public Guid CustomerId { get; set; }
        public string CustomerName { get; set; }
        public string OrderNumber { get; set; }
    }
}
