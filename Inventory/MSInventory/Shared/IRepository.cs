
using System.Linq;
using System.Threading.Tasks;

namespace m2esolution.co.za.MSInventory.Shared
{
    public interface IRepository<T> where T : class, new()
    {
        IQueryable<T> GetAll();
        Task<T> AddAsync(T entity);
        Task<T> UpdateAsync(T entity);
    }
}