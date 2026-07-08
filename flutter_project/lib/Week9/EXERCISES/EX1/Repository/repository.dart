import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/model.dart';

class RepositoryException implements Exception {
  final String message;
  RepositoryException(this.message);
}



class Repository {
  Future<ButtonData> fetchButtonData() async {
    try {
      Uri url = Uri.parse(
        'https://week9exercisetesting-default-rtdb.asia-southeast1.firebasedatabase.app/.json',
      );
      final response = await http.get(url);

      if (response.statusCode != 200) {
        throw Exception('Failed to fetch data (HTTP ${response.statusCode})');
      }

      final Map<String, dynamic> json = jsonDecode(response.body);
      return ButtonData.fromJson(json);
    } catch (e) {
      throw Exception("Error Occured: $e");
    }
  }


  Future<void> updateisSelected(bool isSelected) async {
    try {
      final Uri url = Uri.parse(
        'https://week9exercisetesting-default-rtdb.asia-southeast1.firebasedatabase.app/.json',
      );
       await http.patch(
        url,
        body: jsonEncode({'isSelected': isSelected}),
      );
    } catch (e) {
      throw RepositoryException("Error: $e");
    }
  }
}



