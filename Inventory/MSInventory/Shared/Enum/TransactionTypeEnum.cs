

namespace MSInventory.Shared.Enum
{
    public enum TransactionTypeEnum
    {
        Inventory, //Stock
        WholesaleInventory, //Stock not sold hold by Branch
        Return, //from customer or branch
        Order, //customer
        Deposit, //fix issue re look later
        Withdrawal, //fix issue. re look later
        RapsInventory,//to be develepod

        BankDeposit,
        BankWithdrawal,
        AtmLoading,
        ClientPayroll,
        InterVendorTransfer,
        TellerBulk,
        Cash4CashClient,
        Vault,
        Cash4Eft,
        Cash4CashSwap,
        WholesaleDeposit,
        VaultWithdrawal,
        WholesaleWithdrawal,
        Adjustment,
        CITRequest
        //Inventory,
        //WholesaleInventory
    }
}
