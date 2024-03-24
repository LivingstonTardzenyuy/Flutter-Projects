import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:chatgpt/constant/api_const.dart';
import 'package:chatgpt/models/models_models.dart';

import '../models/chat_model.dart';

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



  // static Future<void> sendMessage({required String message, required String modelId}) async {
  //     final String? apiKey = dotenv.env['API_KEY'];
  //   try {
  //     // Make the HTTP request
  //     final response = await http.post(
  //       Uri.parse("$BASE_URL/chat/completions"),
  //       headers: {
  //         "Authorization": "Bearer $apiKey",
  //         "Content-Type": "application/json"
  //       },
  //       body: jsonEncode({
  //         "model": modelId,
  //         "messages": [{"role": "user", "content": message}],
  //         "temperature": 0.7
  //       }),
  //     );
  //
  //     // Check if request was successful
  //     if (response.statusCode == 200) {
  //       // Parse JSON response
  //       final jsonResponse = jsonDecode(response.body);
  //
  //       // Log the response
  //       log('Response: $jsonResponse');
  //     } else {
  //       // Handle non-200 status code
  //       log('Request failed with status: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     // Handle any errors
  //     log('Error: $error');
  //     rethrow; // Rethrow the error for handling in calling function
  //   }
  // }


  Future<void> sendMessage({required String message, required String modelId,required Function(ChatModel) onMessageReceived,
  }) async {
    final String? apiKey = dotenv.env['API_KEY'];
    try {
      // Make the HTTP request
      final response = await http.post(
        Uri.parse("$BASE_URL/chat/completions"),
        headers: {
          "Authorization": "Bearer $apiKey",
          "Content-Type": "application/json"
        },
        body: jsonEncode({
          "model": modelId,
          "messages": [{"role": "user", "content": message}],
          "temperature": 0.7
        }),
      );

      // Check if request was successful
      if (response.statusCode == 200) {
        // Parse JSON response
        final jsonResponse = jsonDecode(response.body);

        // Extract chat message from the response
        final chatMessage = ChatModel.fromJson(jsonResponse['choices'][0]['message']);

        // Add the chat message to the list
        // setState(() {
        //   chatMessages.add(chatMessage);
        // });
        onMessageReceived(chatMessage);
      } else {
        // Handle non-200 status code
        log('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      // Handle any errors
      log('Error: $error');
      rethrow; // Rethrow the error for handling in calling function
    }
  }
}
// }
