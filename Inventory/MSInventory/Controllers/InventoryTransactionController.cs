using Microsoft.AspNetCore.Mvc;
using MSInventory.Model.Dtos;
using MSInventory.Service.Interface;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MSInventory.Controllers
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

        [HttpPost("Production/Capture")]
        public async Task<IActionResult> CaptureTransactionToCreditProduction([FromBody] InventoryTransactionDto inventoryTransactionDto)
        {
            var response = await _inventoryTransactionService.CaptureTransactionToCreditProduction(inventoryTransactionDto);
            return Ok(new { message = $"Inventory Is Successfully Captured.", data = response });
        }

        [HttpGet("Unverified/Production/{vendorId}")]
        public async Task<List<InventoryTransactionDto>> GetInventoryTransactionCapturedInProduction(Guid vendorId)
        {
            return await _inventoryTransactionService.GetInventoryTransactionCapturedInProduction(vendorId);
        }

        [HttpPost("Send/Production")]
        public async Task<IActionResult> VerifyTransactionSendToProduction([FromBody] List<InventoryTransactionDto> inventoryTransactionDtos)
        {
            var response = await _inventoryTransactionService.VerifyTransactionSendToProduction(inventoryTransactionDtos);
            return Ok(new { message = $"Inventory Send To Warehouse.", data = response });
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
