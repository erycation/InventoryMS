

using Microsoft.EntityFrameworkCore;
using MSInventory.Model;
using MSInventory.Model.Dtos;
using MSInventory.Repository.Interface;
using MSInventory.Service.Interface;
using MSInventory.Shared.Helpers;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Linq;

namespace MSInventory.Service
{
    public class OrderService : IOrderService
    {

        private readonly IOrderRepository _orderRepository;

        public OrderService(IOrderRepository orderRepository)
        {
            _orderRepository = orderRepository;
        }

        public async Task<OrderDto> AddOrder(OrderDto orderDto)
        {
            var requestOrder = new Order
            {
                CustomerId = orderDto.CustomerId,
                OrderNumber = orderDto.OrderNumber
            };

            var responseOrder = await _orderRepository.AddAsync(requestOrder);
            return responseOrder != null ? new OrderDto(responseOrder) : throw new AppException($"Failed To Create Order");
        }

        public async Task<OrderDto> GetOrderById(Guid orderId)
        {
            var order = await _orderRepository.GetAll().FirstOrDefaultAsync(x => x.Id == orderId);
            return new OrderDto(order);
        }

        public async Task<List<OrderDto>> GetOrdersByCustomer(Guid customerId)
        {
            var ordersDto = new List<OrderDto>();
            var orders = await _orderRepository.GetAll().Where(o => o.CustomerId == customerId).ToListAsync();

            foreach (var order in orders)
            {
                ordersDto.Add(new OrderDto(order));
            }
            return ordersDto;
        }

        //public async Task<OrderDto> UpdateOrder(OrderDto orderDto)
        //{
        //    throw new NotImplementedException();
        //}

    }
}