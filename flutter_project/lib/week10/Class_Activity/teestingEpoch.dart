// import 'package:jwt_decoder/jwt_decoder.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

void main() async {
  Uri url = Uri.parse("http://localhost:3000/login");
  Map<String, dynamic> body = {"username": 'john', "password": "1234"};
  Response response = await http.post(
    url,
    body: jsonEncode(body),
    headers: {"Content-Type": "application/json"},
  );

  if (response.statusCode != 200) {
    print("Error code: ${response.statusCode}");
    return;
  }

  Map<String, dynamic> json = jsonDecode(response.body);
  String token = json['token'];
  print("The Token is : $token"); 

}
