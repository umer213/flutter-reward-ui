import 'dart:convert';
import 'package:http/http.dart' as http;

// Basic API client without proper error handling
class ApiClient {
  String baseUrl = 'https://api.example.com';
  
  Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl$endpoint'));
    return json.decode(response.body);
  }
  
  Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    return json.decode(response.body);
  }
}
