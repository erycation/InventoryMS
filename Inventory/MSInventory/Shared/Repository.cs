using System;
using System.Linq;
using System.Threading.Tasks;

namespace MSInventory.Shared
{
    public class Repository<T> : IRepository<T> where T : class, new()
    {

        protected readonly InventoryDBContext _inventoryDBContext;

        public Repository(InventoryDBContext inventoryDBContext)
        {
            _inventoryDBContext = inventoryDBContext;
        }

        public async Task<T> AddAsync(T entity)
        {
            if (entity == null)
            {
                throw new ArgumentNullException($"{nameof(AddAsync)} entity must not be null");
            }

            try
            {
                await _inventoryDBContext.AddAsync(entity);
                await _inventoryDBContext.SaveChangesAsync();

                return entity;
            }
            catch (Exception ex)
            {
                throw new Exception($"{nameof(entity)} could not be saved: {ex.Message}");
            }
        }

        public IQueryable<T> GetAll()
        {
            try
            {
                return _inventoryDBContext.Set<T>();
            }
            catch (Exception ex)
            {
                throw new Exception($"Couldn't retrieve entities: {ex.Message}");
            }
        }

        public async Task<T> UpdateAsync(T entity)
        {
            if (entity == null)
            {
                throw new ArgumentNullException($"{nameof(AddAsync)} entity must not be null");
            }

            try
            {
                _inventoryDBContext.Update(entity);
                await _inventoryDBContext.SaveChangesAsync();

                return entity;
            }
            catch (Exception ex)
            {
                throw new Exception($"{nameof(entity)} could not be updated: {ex.Message}");
            }
        }
    }
}
