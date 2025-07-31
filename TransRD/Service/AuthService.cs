using System.Text;
using System.Text.Json;
using TransRD.Interfaces;
using TransRD.Models;

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

    public async Task<AuthResponse> RegisterAsync(RegisterRequest request)
    {
        var content = new StringContent(JsonSerializer.Serialize(request, _options), Encoding.UTF8, "application/json");
        var response = await _httpClient.PostAsync("Auth/register", content);

        if (!response.IsSuccessStatusCode)
        {
            var error = await response.Content.ReadAsStringAsync();
            throw new Exception($"Registration failed: {error}");
        }

        var json = await response.Content.ReadAsStringAsync();
        return JsonSerializer.Deserialize<AuthResponse>(json, _options);
    }
}
