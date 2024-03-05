import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:chatgpt/constant/api_const.dart';


class ApiService{
  static Future<void> getModels() async {
    try {
      var response = await http.get(Uri.parse("$BASE_URL/modelsdfd"),
      headers: {
        "Authorization": "Bearer $API_KEY"},
      );
      Map jsonResponse = jsonDecode(response.body);           //decoding the response
      if(jsonResponse['error'] != null){
        print("jsonResponse['error'] ${jsonResponse['error']['message']}");
        throw HttpException(jsonResponse['error']['message']);
      }
      print("jsonresponse: $jsonResponse");
    } catch(error) {
      print('error $error');
    }
  }
}