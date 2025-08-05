using System;
using System.Diagnostics;
using System.Threading.Tasks;
using TransRD.Interfaces;


namespace TransRD.Models.Usuarios_Model
{
    public class LoadProfile
    {
        private readonly IPerfilService _perfilService;

        public string Nombre { get; private set; }
        public string Correo { get; private set; }
        public string MiembroDesde { get; private set; }

        public LoadProfile(IPerfilService perfilService)
        {
            _perfilService = perfilService;
        }
        public Usuario Usuario { get; set; }
        public async Task CargarPerfilAsync()
        {
            try
            {
                 Usuario = await _perfilService.ObtenerPerfilAsync();
                if (Usuario != null)
                {
                    Nombre = Usuario.Nombre;
                    Correo = Usuario.Email;
                    MiembroDesde = Usuario.FechaRegistro?.ToString("MMMM yyyy");
                }
               
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error cargando perfil: {ex.Message}");
            }
        }
    }
}
