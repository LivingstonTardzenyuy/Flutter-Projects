import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:chatgpt/constant/api_const.dart';
import 'package:chatgpt/models/models_models.dart';

class ApiService {
  static Future<List<ModelsModel>> getModels() async {
    final String? apiKey = dotenv.env['API_KEY'];

    if (apiKey == null) {
      throw Exception("API key not found in environment variables.");
    }

    try {
      var response = await http.get(
        Uri.parse("$BASE_URL/models"),
        headers: {"Authorization": "Bearer $apiKey"},
      );

      if (response.statusCode == 401) {
        throw Exception("Unauthorized: Invalid API key.");
      }

      if (response.statusCode != 200) {
        throw Exception("Failed to fetch data. Status code: ${response.statusCode}");
      }

      Map jsonResponse = jsonDecode(response.body);

      if (jsonResponse['error'] != null) {
        throw HttpException(jsonResponse['error']['message']);
      }

      List temp = [];
      for (var value in jsonResponse["data"]) {
        temp.add(value);
        log("temp $value");
      }

      return ModelsModel.modelsFromSnapshot(temp);
    } catch (error) {
      log('error $error');
      rethrow;
    }
  }

  // Send Message
  static Future<List<ModelsModel>> sendMessage({required String message, required String modelId}) async {
    try
  }
}
