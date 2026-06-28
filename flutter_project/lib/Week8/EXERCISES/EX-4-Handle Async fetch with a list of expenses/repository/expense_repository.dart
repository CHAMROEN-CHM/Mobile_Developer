import '../models/expense.dart';

class ExpenseRepository {
  // Expense singelExpense = Expense(amount: 45, title: "fake");
  List<Expense> expense = [
    Expense(title: "Flutter Course", amount: 19.99),
    Expense(title: "Cinema", amount: 15.69),
    Expense(title: "Salad", amount: 15.69),
    Expense(title: "Guitar", amount: 22.69)
  ];

  Future<List<Expense>> fetchExpense() {
    // Simulate 5 seconds before returnning the success fetch
    return Future.delayed(Duration(seconds: 5), () {
      return expense;
    });
  }
}

class ExpenseException implements Exception {
  final String message;
  ExpenseException(this.message);

  @override
  String toString() => message;
}

final ExpenseRepository expenseRepository =
    ExpenseRepository(); // global access for now
