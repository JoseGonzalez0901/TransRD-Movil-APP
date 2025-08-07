using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Net.Http.Json;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using TransRD.Models;
namespace TransRD.Service
{
    public class ViajesService
    {
        private readonly HttpClient _httpClient;

        public ViajesService(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        // Obtener todos los viajes
        public async Task<List<ViajeDto>> ObtenerViajesAsync()
        {
            return await _httpClient.GetFromJsonAsync<List<ViajeDto>>("api/Viajes");
        }

        // Crear nuevo viaje
        public async Task<bool> CrearViajeAsync(ViajeRequest request)
        {
            var json = JsonSerializer.Serialize(request);
            var content = new StringContent(json, Encoding.UTF8, "application/json");

            var response = await _httpClient.PostAsync("api/Viajes", content);
            return response.IsSuccessStatusCode;
        }

        // Eliminar viaje por ID
        public async Task<bool> EliminarViajeAsync(int id)
        {
            var response = await _httpClient.DeleteAsync($"api/Viajes/{id}");
            return response.IsSuccessStatusCode;
        }
    }

    // DTO para crear viajes
   

    // DTO de respuesta (ajústalo si tu API devuelve más propiedades)
    
}
