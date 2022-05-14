

using Microsoft.EntityFrameworkCore;
using m2esolution.co.za.MSInventory.Model;
using m2esolution.co.za.MSInventory.Model.Dtos;
using m2esolution.co.za.MSInventory.Repository.Interface;
using m2esolution.co.za.MSInventory.Service.Interface;
using m2esolution.co.za.MSInventory.Shared.Helpers;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace m2esolution.co.za.MSInventory.Service
{
    public class OrderItemService : IOrderItemService
    {

        private readonly IOrderItemRepository _orderItemRepository;

        public OrderItemService(IOrderItemRepository orderItemRepository)
        {
            _orderItemRepository = orderItemRepository;
        }

        public async Task<OrderItemDto> AddOrder(OrderItemDto orderItemDto)
        {
            var requestOrderItem = new OrderItem
            {
                OrderId = orderItemDto.OrderId
            };

            var responseOrderItem = await _orderItemRepository.AddAsync(requestOrderItem);
            return responseOrderItem != null ? new OrderItemDto(responseOrderItem) : throw new AppException($"Failed To Create OrderItem");
        }
    }
}
