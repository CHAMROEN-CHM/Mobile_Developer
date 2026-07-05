import 'dart:convert' as convert show jsonDecode;
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

// class ToDo {
//   String id;
//   String userId;
//   String title;
//   bool complete;
//   ToDo(this.id, this.userId, this.title, this.complete);
// }

// Future<ToDo> fetchToDo() async {
//   ToDo result = ToDo(id, userId, title, complete);

//   // YourCodeHere

//   return result;
// }

// void main() async {
//   Uri url = Uri.parse("https://jsonplaceholder.typicode.com/todos/3");
//   Response response = await http.get(url);
//   Map<String, dynamic> json =
//       convert.jsonDecode(response.body) as Map<String, dynamic>;
//   String title = json["title"];
//   int id = json["id"];
//   bool completed = json["completed"];
//   print("Title: $title, ID: $id, Completed: $completed.");
// }

class User {
  String name;
  int score;
  User(this.name, this.score);

  static User fromJson(Map<String, dynamic> json) {
    const String namekey = 'name';
    const String scorekey = 'score';

    assert(json["name"] is String);
    assert(json["score"] is int);
    String name = json[namekey];
    int score = json[scorekey];

    return User(name, score);
  }

  @override
  String toString() {
    return "Name: $name\nScore: $score";
  }
}

void main() async {
  Uri url = Uri.parse(
    'https://g-1-testing-default-rtdb.asia-southeast1.firebasedatabase.app/Users/user01.json',
  );

  try {
    Response response = await http.get(url);
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch products (HTTP ${response.statusCode})');
    }
    if (response.body == "null") {
      throw Exception("There is no that user id");
    }

    Map<String, dynamic> json = convert.jsonDecode(response.body);

    User u1 = User.fromJson(json);
    print(u1);
  } catch (e) {
    print("The error is: $e");
  }
}
