import 'dart:convert';
import 'package:http/http.dart' as http;

void downloadUserProfile() async {
  final response = await http.get("https://www.instagram.com/vincenzo.scalcione/?__a=1");

  if(response.statusCode != 200){
    throw Exception("Error while downloading user profile");
  }

  final data = json.decode(response.body);
}
