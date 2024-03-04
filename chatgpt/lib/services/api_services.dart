class ApiService{
  static Future<void> getModels() async {
    try {
      http.get(Uri.parse("https://api.openai.com/v1/models"),
      headers: {
        "Authorization": "Bearer "
      }
      );

    } catch(error) {
      print('error $error');
    }
  }
}