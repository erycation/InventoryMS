using MSInventory.Model.Dtos;
using MSInventory.Model.Request;
using System.Threading.Tasks;

namespace MSInventory.Service.Interface
{
    public interface IAuthenticateService
    {
        Task<AuthToken> Login(Credentials credentials);
    }
}
