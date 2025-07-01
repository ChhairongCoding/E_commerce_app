final baseUrl = "https://e-commerce-api-84qw.onrender.com/api" ;

Map<String, String> headers(String token) {
  return {'Content-Type': 'application/json', 'Authorization': 'Bearer $token'};
}