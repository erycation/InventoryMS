using Microsoft.EntityFrameworkCore;

namespace MSInventoryApi.Shared
{
    public class InventoryDBContext : DbContext
    {

        public InventoryDBContext(DbContextOptions<InventoryDBContext> options) : base(options)
        {
            //optionsBuilder.ConfigureWarnings(warnings => warnings.Throw(CoreEventId.IncludeIgnoredWarning));
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            //modelBuilder.Entity<StockCountSheetReportDto>().HasNoKey();
        }
    }
}
