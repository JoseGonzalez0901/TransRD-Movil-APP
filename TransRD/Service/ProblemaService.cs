using System.Collections.Generic;
using System.Net.Http;
using System.Net.Http.Json;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using TransRD.Models;
namespace TransRD.Services
{
    public class ProblemaService
    {
        private readonly HttpClient _httpClient;

        public ProblemaService(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        // Obtener todos los reportes
        public async Task<List<ReporteProblemaDto>> ObtenerReportesAsync()
        {
            return await _httpClient.GetFromJsonAsync<List<ReporteProblemaDto>>("api/ReportarProblema");
        }

        // Crear un nuevo reporte
        public async Task<bool> ReportarProblemaAsync(ReportarProblemaRequest request)
        {
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
