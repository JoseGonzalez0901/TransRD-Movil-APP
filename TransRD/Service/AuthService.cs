using System.Text;
using System.Text.Json;
using TransRD.Interfaces;
using TransRD.Models;
using TransRD.Models.Usuarios_Model;
public class AuthService : IAuthService
{
    private readonly HttpClient _httpClient;
    private readonly JsonSerializerOptions _options;

    public AuthService(HttpClient httpClient)
    {
        _httpClient = httpClient;
        _options = new JsonSerializerOptions { PropertyNamingPolicy = JsonNamingPolicy.CamelCase };
    }

    public async Task<AuthResponse> LoginAsync(LoginRequest request)
    {
        var content = new StringContent(JsonSerializer.Serialize(request, _options), Encoding.UTF8, "application/json");
        var response = await _httpClient.PostAsync("api/Auth/login", content);


        if (!response.IsSuccessStatusCode)
        {
            var error = await response.Content.ReadAsStringAsync();
            throw new Exception($"Login failed: {error}");
        }

        var json = await response.Content.ReadAsStringAsync();
        return JsonSerializer.Deserialize<AuthResponse>(json, _options);
    }
    public async Task<Usuario?> ObtenerUsuarioDesdeTokenAsync()
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

    public async Task<AuthResponse> RegisterAsync(RegisterRequest request)
    {
        var content = new StringContent(JsonSerializer.Serialize(request, _options), Encoding.UTF8, "application/json");
        var response = await _httpClient.PostAsync("api/Auth/register", content);

        if (!response.IsSuccessStatusCode)
        {

            var error = await response.Content.ReadAsStringAsync();
            throw new Exception($"Registration failed: {error}");
        }

        var json = await response.Content.ReadAsStringAsync();
        return JsonSerializer.Deserialize<AuthResponse>(json, _options);
    }
}
