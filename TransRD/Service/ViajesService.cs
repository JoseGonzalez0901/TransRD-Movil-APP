// using Microsoft.Maui.Storage;
using System.Net.Http.Headers;
using Microsoft.Maui.Storage;
using System.Net.Http.Json;
using System.Text;
using System.Text.Json;
using TransRD.Models;

namespace TransRD.Service;

public class ViajesService
{
    private readonly HttpClient _http;
    private readonly JsonSerializerOptions _json = new()
    {
        PropertyNamingPolicy = JsonNamingPolicy.CamelCase,
        DefaultIgnoreCondition = System.Text.Json.Serialization.JsonIgnoreCondition.WhenWritingNull
    };

    public ViajesService(HttpClient http) => _http = http;

    private void EnsureAuthHeader()
    {
        var token = Preferences.Get("auth_token", null); // <- tu clave
        _http.DefaultRequestHeaders.Authorization =
            string.IsNullOrWhiteSpace(token) ? null : new AuthenticationHeaderValue("Bearer", token);
    }
    public async Task<FinalizarViaje>finalizarViajeActulAsync(int id, FinalizarViaje request, CancellationToken ct = default)
    {
        EnsureAuthHeader();
        var content = new StringContent(JsonSerializer.Serialize(request, _json), Encoding.UTF8, "application/json");
        var resp = await _http.PutAsync($"api/Viajes/actual/Put/{id}", content, ct);
        resp.EnsureSuccessStatusCode();
        var env = await resp.Content.ReadFromJsonAsync<ApiEnvelope<FinalizarViaje>>(_json, ct);
        return new FinalizarViaje();
    }
    public async Task<ViajeDto?> obtenerHistorialViajes(CancellationToken ct = default)
    {
        EnsureAuthHeader();
        var resp = await _http.GetAsync("api/Viajes", ct);
        resp.EnsureSuccessStatusCode();
        var env = await resp.Content.ReadFromJsonAsync<ApiEnvelope<List<ViajeDto>>>(_json, ct);
        return new ViajeDto();
    }

    public async Task <ViajeDto?> ObtenerViajeActualAsync(string ID,CancellationToken ct = default)
    {
        EnsureAuthHeader();
        try
        {
            var resp = await _http.GetAsync($"api/Viajes/actual/Get/{ID}", ct);
            if (resp.StatusCode == System.Net.HttpStatusCode.NotFound) return null;
            resp.EnsureSuccessStatusCode();
            var env = await resp.Content.ReadFromJsonAsync<ApiEnvelope<ViajeDto>>(_json, ct);
            return env?.Result;
        }
        catch
        {
            // Manejo de excepciones, por ejemplo, si el servidor no responde

            return null; // o lanzar una excepción personalizada
        }
        
        
    }
    public async Task<List<ViajeDto>> ObtenerViajesAsync(CancellationToken ct = default)
    {
        EnsureAuthHeader();
        var resp = await _http.GetAsync("api/Viajes", ct);
        resp.EnsureSuccessStatusCode();
        var env = await resp.Content.ReadFromJsonAsync<ApiEnvelope<List<ViajeDto>>>(_json, ct);
        return env?.Result ?? new();
    }

    public async Task<ViajeDto?> CrearViajeAsync(ViajeRequest request, CancellationToken ct = default)
    {
        EnsureAuthHeader();
        var content = new StringContent(JsonSerializer.Serialize(request, _json), Encoding.UTF8, "application/json");
        var resp = await _http.PostAsync("api/Viajes", content, ct);
        resp.EnsureSuccessStatusCode();
        var env = await resp.Content.ReadFromJsonAsync<ApiEnvelope<ViajeDto>>(_json, ct);
        return env?.Result;
    }

    public async Task<bool> ActualizarViajeAsync(int id, ViajeRequest request, CancellationToken ct = default)
    {
        EnsureAuthHeader();
        var content = new StringContent(JsonSerializer.Serialize(request, _json), Encoding.UTF8, "application/json");
        var resp = await _http.PutAsync($"api/Viajes/{id}", content, ct);
        return resp.IsSuccessStatusCode;
    }

    public async Task<bool> EliminarViajeAsync(int id, CancellationToken ct = default)
    {
        EnsureAuthHeader();
        var resp = await _http.DeleteAsync($"api/Viajes/{id}", ct);
        return resp.IsSuccessStatusCode;
    }
}
