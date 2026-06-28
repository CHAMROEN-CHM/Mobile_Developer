// Future<String> fetchData({bool shouldFail = false}) {
//   return Future.delayed(Duration(seconds: 2), () {
//     if (shouldFail) {
//       throw Exception("An error occurred!");
//     }
//     return "Data loaded successfully!";
//   });
// }

// void main() async {
//   print("Fetching data... ");
//   try {
//     String value = await fetchData(shouldFail: false);
//     print("Completed with value: $value");
//   } catch (e) {
//     print("The error is $e");
//   }
// }


import 'package:http/http.dart' as http;

void main() async {
  var url = Uri.https("https://fooapi.com/api/products");
  var response = await http.get(url);
  print(response);
}
