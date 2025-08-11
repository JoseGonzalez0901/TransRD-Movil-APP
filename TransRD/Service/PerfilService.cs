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
using System.Net.Http.Headers;
using System.Text.Json.Serialization;
using TransRD.Models;
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
            var wrapper = JsonSerializer.Deserialize<UsuarioEnvelope>(json, new JsonSerializerOptions
            {
                PropertyNamingPolicy = JsonNamingPolicy.CamelCase
            });

            return wrapper?.Usuario;
        }
        private void EnsureAuthHeader()
        {
            var token = Preferences.Get("auth_token", null); // <- tu clave
            _httpClient.DefaultRequestHeaders.Authorization =
                string.IsNullOrWhiteSpace(token) ? null : new AuthenticationHeaderValue("Bearer", token);
        }
        public async Task<bool> GuardarPerfilAsync(Usuario usuario, CancellationToken ct = default)
        {

            var token = Preferences.Get("auth_token", string.Empty);
            if (string.IsNullOrWhiteSpace(token))
                return false;

            // Authorization header (recomendado)
            using var req = new HttpRequestMessage(HttpMethod.Put, "api/Usuarios/me");
            req.Headers.Authorization = new AuthenticationHeaderValue("Bearer", token);

            // Body según el contrato que mostraste
            var payload = new UpdateUsuarioRequest
            {
                Token = token, // si tu API lo requiere también en el body
                Usuario = new UsuarioUpdate
                {
                    Nombre= usuario.Nombre,
                    Email = usuario.Email,
                    Telefono = usuario.Telefono,
                    Estado = "Activo",
                    Foto = "usuario.Foto",
                    Roles = "Usuario",
                    FechaRegistro = DateTime.UtcNow, // o la fecha que quieras
                }
            };

            var options = new JsonSerializerOptions
            {
                PropertyNamingPolicy = JsonNamingPolicy.CamelCase,
                DefaultIgnoreCondition = JsonIgnoreCondition.WhenWritingNull
            };

            var json = JsonSerializer.Serialize(payload, options);
            req.Content = new StringContent(json, Encoding.UTF8, "application/json");

            using var res = await _httpClient.SendAsync(req, ct);
            return res.IsSuccessStatusCode;
        }
    }

}
