import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

enum UserRole { admin, student, teacher }

class User {
  final String name;
  final UserRole role;

  User({required this.name, required this.role});

  static User fromJson(Map<String, dynamic> json) {
    String name = json["username"];

    UserRole role = UserRole.values.firstWhere(
      (element) => element.name == json["role"],
    );
    return User(name: name, role: role);
  }
}

class AuthSession {
  final User user;
  final String token;
  final DateTime expiration;

  AuthSession({
    required this.user,
    required this.token,
    required this.expiration,
  });
}

void main() async {
  Uri baseUri = Uri.parse("http://localhost:3000");
  Uri loginUri = baseUri.replace(path: "login");

  Map<String, dynamic> body = {"username": "ronan", "password": "thebest"};

  Response response = await http.post(
    loginUri,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(body),
  );
  Map<String, dynamic> json = jsonDecode(response.body);

  if (response.statusCode != 200) {
    String error = json["error"];
    throw Exception("Error : \n $error");
  }

  //   Get the token
  String token = json["token"];

  //  DEcode the token
  Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
  int expInSeconds = decodedToken["exp"];

  DateTime expDate = DateTime.fromMillisecondsSinceEpoch(expInSeconds * 1000);

  User user = User.fromJson(decodedToken);

  AuthSession session = AuthSession(
    expiration: expDate,
    token: token,
    user: user,
  );

  // Acces to the protected ressource
  Uri employeesUri = baseUri.replace(path: "employees");

  response = await http.get(
    employeesUri,
    headers: {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json",
    },
  );
  List<dynamic> employeeJson = jsonDecode(response.body);

  if (response.statusCode != 200) {
    throw Exception("Error : \n ${response.body} ");
  }

  print(employeeJson);

  final storage = FlutterSecureStorage();

  // Save token after login
  await storage.write(key: "auth_token", value: token);

  runApp(MaterialApp(home: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("hello"));
  }
}