import 'dart:convert';
import '../../data/dto/todo_dto.dart';
import '../repository/repository_exception.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import '../../models/todo.dart';

class TodoRepository {
  static final global = TodoRepository(); // unique instance

  // final List<Todo> fakeTodos = [
  //   Todo(id: '1', title: 'Buy groceries', completed: false),
  //   Todo(id: '2', title: 'Finish Flutter homework', completed: true),
  //   Todo(id: '3', title: 'Call the dentist', completed: false),
  //   Todo(id: '4', title: 'Read 20 pages of a book', completed: true),
  //   Todo(id: '5', title: 'Go for a 30-minute walk', completed: false),
  // ];

  Future<List<Todo>> getTodos() async {
    //  TODO
    //  Adapt the code to handle firebase data fetch
    //

    // return Future.delayed(Duration(seconds: 1), () {
    //   return fakeTodos;
    // )};
    try {
      Uri url = Uri.parse(
        "https://week9ex2-c3897-default-rtdb.asia-southeast1.firebasedatabase.app/Todo.json",
      );

      Response response = await http.get(url);

      if (response.statusCode != 200) {
        throw Exception("Failed to fetch data (HTTP ${response.statusCode})");
      }

      final Map<String, dynamic> json = jsonDecode(response.body);

      final List<Todo> todos = json.entries.map((entry) {
        final id = entry.key;
        final json = entry.value as Map<String, dynamic>;

        return TodoDto.fromJson(id, json);
      }).toList();

      return todos;
    } on RepositoryException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> updateCompleted(String todoId, bool completed) async {
    //  TODO
    //  Adapt the code to handle firebase data fetch
    //

    // int index = fakeTodos.indexWhere((e) => e.id == todoId);
    // fakeTodos[index] = fakeTodos[index].copyWith(completed);

    // return Future.delayed(Duration(microseconds: 1), () => true);
    try {
      Uri url = Uri.parse(
        "https://week9ex2-c3897-default-rtdb.asia-southeast1.firebasedatabase.app/Todo/$todoId.json",
      );
      Response response = await http.patch(
        url,
        body: jsonEncode({"completed": completed}),
      );
      if (response.statusCode != 200) {
        throw Exception("Error Http Status: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Can't Update the Data to the Firebase");
    }
  }
}
