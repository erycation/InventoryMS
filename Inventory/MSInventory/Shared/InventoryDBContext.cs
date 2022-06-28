

using MSInventory.Model;
using MSInventory.Model.Dtos;
using Microsoft.EntityFrameworkCore;
using MSInventory.Shared.Utils;

namespace MSInventory.Shared
{
    public class InventoryDBContext : DbContext
    {

        public InventoryDBContext(DbContextOptions<InventoryDBContext> options) : base(options)
        {
            //optionsBuilder.ConfigureWarnings(warnings => warnings.Throw(CoreEventId.IncludeIgnoredWarning));
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<StockCountSheetReportDto>().HasNoKey();
            modelBuilder.Entity<StockTakingDto>().HasNoKey();            
            modelBuilder.Entity<VendorInvoiceReportDto>().HasNoKey();
            modelBuilder.Entity<VendorInvoiceItemDto>().HasNoKey();
            modelBuilder.Entity<InventoryInStockDto>().HasNoKey();
            modelBuilder.Entity<ReconcilationReportDto>().HasNoKey();
            modelBuilder.Entity<ReturnResult>().HasNoKey();            
        }

        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<Vendor> Vendors { get; set; }
        public virtual DbSet<VendorLocation> VendorLocations { get; set; }
        public virtual DbSet<Inventory> Inventories { get; set; }
        public virtual DbSet<InventoryPrice> InventoryPrices { get; set; }
        public virtual DbSet<ExpectedInventory> ExpectedInventories { get; set; }
        public virtual DbSet<InventoryTransaction> InventoryTransactions { get; set; }
        public virtual DbSet<InventoryCertificate> InventoryCertificates { get; set; }
        public virtual DbSet<InventoryBalance> InventoryBalances { get; set; }
        public virtual DbSet<Customer> Customers { get; set; }
        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<OrderItem> OrderItems { get; set; }
        public virtual DbSet<StockTakingDto> StockTakingDtos { get; set; }
        public virtual DbSet<StockCountSheetReportDto> StockCountSheetReportDtos { get; set; }
        public virtual DbSet<VendorInvoiceReportDto> VendorInvoiceReportDtos { get; set; }
        public virtual DbSet<VendorInvoiceItemDto> VendorInvoiceItemDtos { get; set; }
        public virtual DbSet<InventoryInStockDto> InventoryInStockDtos { get; set; }
        public virtual DbSet<ReconcilationReportDto> ReconcilationReportDtos { get; set; }
        public virtual DbSet<ReturnResult> ReturnResults { get; set; }
        
    }
}
