import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:chatgpt/constant/api_const.dart';


class ApiService{
  static Future<void> getModels() async {
    try {
      var response = await http.get(Uri.parse("https://api.openai.com/v1/models"),
      headers: {
        "Authorization": "Bearer $API_KEY"},
      );
      Map jsonResponse = jsonDecode(response.body);           //decoding the response
      print("jsonresponse $jsonResponse");
    } catch(error) {
      print('error $error');
    }
  }
}