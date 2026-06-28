import '../../models/expense.dart';

class ExpenseRepositoryMock {
  Future<Expense> fetchExpense() {
    return Future.delayed(Duration(seconds: 2), () {
      throw FetchException("Cybersecurity students hacked the server !!");
    });
  }
}

class FetchException implements Exception {
  final String message;

  FetchException(this.message);
}

ExpenseRepositoryMock repository = ExpenseRepositoryMock();
