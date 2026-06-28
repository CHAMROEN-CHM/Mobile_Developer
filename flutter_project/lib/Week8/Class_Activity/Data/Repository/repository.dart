import '../../models/expense.dart';

class ExpenseRepositoryMock {
  Future<Expense> fetchExpense() {
    return Future.delayed(Duration(seconds: 2), () {
      return Expense(title: "fake expense", amount: 1);
    });
      
  }
}

ExpenseRepositoryMock repository = ExpenseRepositoryMock();
