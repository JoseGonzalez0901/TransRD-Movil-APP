using System.Threading.Tasks;
using TransRD.Models;

namespace TransRD.Services
{
    public interface IPerfilService
    {
        Task<Perfil?> ObtenerPerfilAsync();
    }
}
