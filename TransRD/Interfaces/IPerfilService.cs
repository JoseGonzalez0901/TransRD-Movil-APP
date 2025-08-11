using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TransRD.Models.Usuarios_Model;
namespace TransRD.Interfaces
{
    public interface IPerfilService
    {
        Task<Usuario?>  ObtenerPerfilAsync();
        Task<bool> GuardarPerfilAsync(Usuario usuario, CancellationToken ct = default);
    }

}
