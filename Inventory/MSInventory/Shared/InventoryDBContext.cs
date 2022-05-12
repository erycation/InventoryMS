

using m2esolution.co.za.MSInventory.Model;
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
            //modelBuilder.Entity<PreviewInventoryLedgerDto>().HasNoKey();
        }

        //public virtual DbSet<Branch> Branches { get; set; }

        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<Vendor> Vendors { get; set; }
        public virtual DbSet<VendorLocation> VendorLocations { get; set; }
        public virtual DbSet<Inventory> Inventories { get; set; }
        public virtual DbSet<InventoryPrice> InventoryPrices { get; set; }
        public virtual DbSet<ExpectedInventory> ExpectedInventories { get; set; }
        public virtual DbSet<InventoryTransaction> InventoryTransactions { get; set; }
        
    }
}
