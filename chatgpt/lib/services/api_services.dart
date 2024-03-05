import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:chatgpt/models/models_models.dart';
import 'package:http/http.dart' as http;
import 'package:chatgpt/constant/api_const.dart';


class ApiService{
  static Future<List<ModelsModel>> getModels() async {
    try {
      var response = await http.get(Uri.parse("$BASE_URL/models"),
      headers: {
        "Authorization": "Bearer $API_KEY"},
      );
      Map jsonResponse = jsonDecode(response.body);           //decoding the response
      if(jsonResponse['error'] != null){
        // print("jsonResponse['error'] ${jsonResponse['error']['message']}");
        throw HttpException(jsonResponse['error']['message']);
      }
      // print("jsonresponse: $jsonResponse");
      List temp = [];
      for (var value in jsonResponse["data"]){
        temp.add(value);
        log("temp $value");
      }
      return ModelsModel.modelsFromSnapshot(temp);
    } catch(error) {
      log('error $error');
      rethrow;
    }
  }
}