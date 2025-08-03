using System.Net.Http.Json;
using TransRD.Models;

namespace TransRD.Services
{
    public class PerfilService : IPerfilService
    {
        private readonly HttpClient http;

        public PerfilService()
        {
            http = new HttpClient
            {
                BaseAddress = new Uri("http://10.0.2.2:5000/")
            };
        }

        public async Task<Perfil?> ObtenerPerfilAsync()
        {
            return await http.GetFromJsonAsync<Perfil>("api/Perfil");
        }
    }
}
