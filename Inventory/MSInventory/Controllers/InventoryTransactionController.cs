using Microsoft.AspNetCore.Mvc;
using m2esolution.co.za.MSInventory.Model.Dtos;
using m2esolution.co.za.MSInventory.Service.Interface;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace m2esolution.co.za.MSInventory.Controllers
{

    [Route("api/[controller]")]
    [ApiController]
    public class InventoryTransactionController : ControllerBase
    {
        private readonly IInventoryTransactionService _inventoryTransactionService;

        public InventoryTransactionController(IInventoryTransactionService inventoryTransactionService)
        {
            _inventoryTransactionService = inventoryTransactionService;
        }

        [HttpGet("Awaiting/Accepted/{vendorId}")]
        public async Task<List<InventoryTransactionDto>> GetInventoryTransactionAwaitingToAcceptByVendor(Guid vendorId)
        {
            return await _inventoryTransactionService.GetInventoryTransactionAwaitingToAcceptByVendor(vendorId);
        }

        [HttpGet("Outgoing/NotAccepted/{vendorId}")]
        public async Task<List<InventoryTransactionDto>> GetOutgoingInventoryTransactionAwaitingToAcceptByVendor(Guid vendorId)
        {
            return await _inventoryTransactionService.GetOutgoingInventoryTransactionAwaitingToAcceptByVendor(vendorId);
        }

        [HttpPost("Accept/Vendor/{vendorId}/{userId}")]
        public async Task<IActionResult> AcceptAwaitingTransactionInToVendor([FromBody] List<InventoryTransactionDto> inventoryTransactionDtos, Guid vendorId, Guid userId)
        {
            var response = await _inventoryTransactionService.AcceptAwaitingTransactionInToVendor(inventoryTransactionDtos, vendorId, userId);
            return Ok(new { message = $"Inventory Accepted.", data = response });
        }

        [HttpPost("Customer/Order")]
        public async Task<IActionResult> CreateCustomerOrder([FromBody] List<CustomerOrderItemToBePlacedDto> customerOrderItemToBePlacedDtos)
        {
            var response = await _inventoryTransactionService.CreateCustomerOrder(customerOrderItemToBePlacedDtos);
            return Ok(new { message = $"Order Number {response} Created.", data = response });
        }
    }
}
