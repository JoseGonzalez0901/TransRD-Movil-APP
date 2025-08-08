using System.Collections.Generic;
using System.Net.Http;
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

        // Obtener todos los reportes
        public async Task<List<ReporteProblemaDto>> ObtenerReportesAsync()
        {
            var response = await _httpClient.GetAsync("api/ReportarProblema");
            if (response.IsSuccessStatusCode)
            {
                var json = await response.Content.ReadAsStringAsync();

                // Deserializar el JSON completo con la propiedad "result"
                var apiResponse = JsonSerializer.Deserialize<ReporteServiceResponse>(json);
                return apiResponse.result;
            }
            return new List<ReporteProblemaDto>();
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
