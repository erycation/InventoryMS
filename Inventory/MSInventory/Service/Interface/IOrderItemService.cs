﻿
using m2esolution.co.za.MSInventory.Model.Dtos;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace m2esolution.co.za.MSInventory.Service.Interface
{
    public interface IOrderItemService
    {
        Task<OrderItemDto> AddOrder(OrderItemDto orderItemDto);
        //Task<OrderDto> UpdateOrder(OrderDto orderDto);
        //Task<OrderDto> GetOrderById(Guid orderId);
        //Task<List<OrderDto>> GetOrdersByCustomer(Guid customerId);
    }
}
