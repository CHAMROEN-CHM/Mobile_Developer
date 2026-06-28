import 'package:flutter/material.dart';
import '../../data/repository/expense_repository_mock.dart';
import '../../models/expense.dart';
import 'expenses_tile.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() {
    return _ExpensesScreenState();
  }
}

enum AsyncState { notStarted, loading, success, error }

class _ExpensesScreenState extends State<ExpensesScreen> {
  AsyncState fetchState = AsyncState.notStarted;

  Expense? expense;
  String? error;

  Widget get content {
    switch (fetchState) {
      case AsyncState.notStarted:
        return Text("Tap on refresh to fetch expense");

      case AsyncState.loading:
        return CircularProgressIndicator();

      case AsyncState.success:
        return ExpenseTile(expense: expense!);

      case AsyncState.error:
        return Text(error!, style: TextStyle(color: Colors.red));
    }
  }

  void fetchData() async {
    fetchState = AsyncState.loading;
    setState(() {}); // refresh the view

    try {
      expense = await repository.fetchExpense();
      fetchState = AsyncState.success;
      setState(() {}); // refresh the view
    } catch(e) {
      error = "No wifi!!";

      fetchState = AsyncState.error;
      setState(() {}); // refresh the view
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        actions: [IconButton(onPressed: fetchData, icon: Icon(Icons.refresh))],
        backgroundColor: Colors.blue[700],
        title: const Text('Ronan-The-Best Expenses App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(child: content),
      ),
    );
  }
}
