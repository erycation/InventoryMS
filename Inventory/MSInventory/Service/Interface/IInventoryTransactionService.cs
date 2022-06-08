
using MSInventory.Model.Dtos;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MSInventory.Service.Interface
{
    public interface IInventoryTransactionService
    {

        Task<InventoryTransactionDto> CaptureTransactionToCreditProduction(InventoryTransactionDto inventoryTransactionDto);
        Task<List<InventoryTransactionDto>> GetInventoryTransactionCapturedInProduction(Guid vendorId);
        Task<InventoryTransactionDto> VerifyTransactionSendToProduction(List<InventoryTransactionDto> inventoryTransactionDtos);
        Task<InventoryTransactionDto> CreditFromExpectedInventoryTransaction(ExpectedInventoryDto expectedInventoryDto, Guid locationVendorId, string trackingNumber);
        Task<InventoryTransactionDto> DebitThroughExpectedInventoryTransaction(ExpectedInventoryDto expectedInventoryDto, Guid locationVendorId, string trackingNumber);
        Task<List<InventoryTransactionDto>> GetInventoryTransactionAwaitingToAcceptByVendor(Guid vendorId);
        Task<List<InventoryTransactionDto>> GetOutgoingInventoryTransactionAwaitingToAcceptByVendor(Guid vendorId);
        Task<InventoryTransactionDto> AcceptAwaitingTransactionInToVendor(List<InventoryTransactionDto> inventoryTransactionDtos, Guid vendorId, Guid userId);
        Task<string> CreateCustomerOrder(List<CustomerOrderItemToBePlacedDto> customerOrderItemToBePlacedDtos);
    }
}
