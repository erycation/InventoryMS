

using Microsoft.EntityFrameworkCore;
using MSInventory.Model;
using MSInventory.Model.Dtos;
using MSInventory.Repository.Interface;
using MSInventory.Service.Interface;
using MSInventory.Shared.Helpers;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MSInventory.Service
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
