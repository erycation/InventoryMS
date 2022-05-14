

using m2esolution.co.za.MSInventory.Model;
using m2esolution.co.za.MSInventory.Model.Dtos;
using Microsoft.EntityFrameworkCore;

namespace m2esolution.co.za.MSInventory.Shared
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
        public virtual DbSet<StockCountSheetReportDto> StockCountSheetReportDtos { get; set; }

    }
}
