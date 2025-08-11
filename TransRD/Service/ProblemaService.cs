using System.Collections.Generic;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using TransRD.Models;
namespace TransRD.Service
{
    public class ProblemaService
    {
        private readonly HttpClient _httpClient;

        public ProblemaService(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }
        private static readonly JsonSerializerOptions _jsonOptions = new()
        {
            PropertyNameCaseInsensitive = true // tolera mayúsculas/minúsculas
        };
        private void EnsureAuthHeader()
        {
            var token = Preferences.Get("auth_token", null); // <- tu clave
            _httpClient.DefaultRequestHeaders.Authorization =
                string.IsNullOrWhiteSpace(token) ? null : new AuthenticationHeaderValue("bearer", token);
        }

        // Obtener todos los reportes
        public async Task<List<ReporteProblemaDto>> ObtenerReportesAsync(CancellationToken ct = default)
        {
            EnsureAuthHeader();

            using var response = await _httpClient.GetAsync("api/ReportarProblema", ct);

            if (response.StatusCode == System.Net.HttpStatusCode.Unauthorized)
            {
                // Si quieres, aquí puedes disparar un flujo de refresh/login
                return new List<ReporteProblemaDto>();
            }

            response.EnsureSuccessStatusCode();

            var json = await response.Content.ReadAsStringAsync(ct);

            var envelope = JsonSerializer.Deserialize<ApiEnvelope<List<ReporteProblemaDto>>>(json, _jsonOptions);

            return envelope?.Result ?? new List<ReporteProblemaDto>();
        }

        // Crear un nuevo reporte
        public async Task<bool> ReportarProblemaAsync(ReportarProblemaRequest request)
        {
            EnsureAuthHeader();
            var json = JsonSerializer.Serialize(request);
            var content = new StringContent(json, Encoding.UTF8, "application/json");

            var response = await _httpClient.PostAsync("api/ReportarProblema", content);
            return response.IsSuccessStatusCode;
        }

        // Eliminar reporte por ID
        public async Task<bool> EliminarReporteAsync(int id)
        {
            var response = await _httpClient.DeleteAsync($"api/ReportarProblema/{id}");
            return response.IsSuccessStatusCode;
        }
    }

    
}
