using m2esolution.co.za.MSInventory.Model.Dtos;
using m2esolution.co.za.MSInventory.Model.Request;
using System.Threading.Tasks;

namespace m2esolution.co.za.MSInventory.Service.Interface
{
    public interface IAuthenticateService
    {
        Task<AuthToken> Login(Credentials credentials);
    }
}
