using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Json;
using System.Text;
using System.Threading.Tasks;
using TransRD.Interfaces;
using System.Net.Http;
using System.Text.Json;
using TransRD.Models.Usuarios_Model;
namespace TransRD.Service
{
    public class PerfilService : IPerfilService
    {
        private readonly HttpClient _httpClient;

        public PerfilService(HttpClient http)
        {
            _httpClient = http;
        }

        public async Task<Usuario?> ObtenerPerfilAsync()
        {
            var token = Preferences.Get("auth_token", string.Empty);
            if (string.IsNullOrEmpty(token))
                return null;

            var response = await _httpClient.GetAsync($"api/Auth/me/{token}");

            if (!response.IsSuccessStatusCode)
                return null;

            var json = await response.Content.ReadAsStringAsync();
            var wrapper = JsonSerializer.Deserialize<UsuarioResponse>(json, new JsonSerializerOptions
            {
                PropertyNamingPolicy = JsonNamingPolicy.CamelCase
            });

            return wrapper?.Result?.Usuario;
        }

        public async Task<bool> GuardarPerfilAsync(Usuario usuario)
        {
            var response = await _httpClient.PutAsJsonAsync("api/Perfil", usuario);
            return response.IsSuccessStatusCode;
        }
    }

}
