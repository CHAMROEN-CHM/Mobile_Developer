import 'package:flutter/material.dart';
import 'package:flutter_project/Week9/EXERCISES/EX1/Repository/repository.dart';
import 'package:flutter_project/Week9/EXERCISES/EX1/model/model.dart';
import '../../utils/async_data.dart';
import 'button.dart';

class MyScreen extends StatefulWidget {
  const MyScreen({super.key});

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  final Repository repo = Repository();

  AsyncData<ButtonData> data = AsyncData.loading();

  void _fetchTodos() async {
    setState(() => data = AsyncData.loading());

    try {
      final result = await repo.fetchButtonData();
      setState(() => data = AsyncData.success(result));
    } on RepositoryException catch (e) {
      setState(() => data = AsyncData.error(e.message));
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    if (data.state == AsyncState.loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    } else {
      return Center(
        child: MyButton(
          data: data.value!,
          onPressed: () {
            setState(() {
              data.value!.isselected = !data.value!.isselected;
              repo.updateisSelected(data.value!.isselected);
            });
          },
        ),
      );
    }
  }
}
