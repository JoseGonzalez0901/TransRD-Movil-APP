using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TransRD.Models;
using TransRD.Models.Usuarios_Model;
namespace TransRD.Interfaces
{
    public interface IAuthService
    {
        Task<AuthResponse> LoginAsync(LoginRequest request);
        Task<AuthResponse> RegisterAsync(RegisterRequest request);
        Task<Usuario?> ObtenerUsuarioDesdeTokenAsync();
    }

}
