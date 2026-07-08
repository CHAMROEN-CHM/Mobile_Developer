import '../../models/todo.dart';
import '../repository/todo_repository.dart';

class TodoDto {
  static const id = "id";
  static const title = "title";
  static const completed = "completed";

  static Todo fromJson(String id, Map<String, dynamic> json) {
    // Assert the map contains the keys  title and completed with the right data types
    const String titlekey = 'title';
    const String completedkey = 'completed';

    assert(json[titlekey] is String);
    assert(json[completedkey] is bool);

    String title = json[titlekey];
    bool completed = json[completedkey];

    // Return the right todo object by reading the json map
    return Todo(id: id, title: title, completed: completed);
  }

  static Map<String, dynamic> toJson(Todo todo) {
    return {title: todo.title, completed: todo.completed};
  }
}

void main() async {
  // const jsonString = '''

  // {
  //   "1": {
  //     "title": "Buy groceries",
  //     "completed": false
  //   },
  //   "2": {
  //     "title": "Finish Flutter homework",
  //     "completed": true
  //   },
  //   "3": {
  //     "title": "Call the dentist",
  //     "completed": false
  //   }
  // }
  // ''';

  // Decode JSON string into Map
  // final Map<String, dynamic> data = jsonDecode(jsonString);

  // Convert each entry using fromJson
  // final List<Todo> todos = data.entries.map((entry) {
  //   final id = entry.key;
  //   final json = entry.value as Map<String, dynamic>;

  //   return TodoDto.fromJson(id, json);
  // }).toList();

  List<Todo> todos = await TodoRepository.global.getTodos();

  for (var todo in todos) {
    print(todo);
  }
}
