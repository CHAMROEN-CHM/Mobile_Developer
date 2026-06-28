import 'package:flutter/material.dart';
import '../../data/expenses_data.dart';
import '../../models/expense.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          title: Text(expense.title),
          subtitle: Text("\$ ${expense.amount}".toString()),
          leading: Icon(expense.category.icon),
        ),
      ),
    );
  }
}

class ExpenseForm extends StatefulWidget {
  final void Function(Expense expense) addExpense;
  const ExpenseForm({super.key, required this.addExpense});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  TextEditingController titleController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  void onCancel() {
    Navigator.pop(context);
  }

  void onSubmit() {
    Expense expense = Expense(
      title: titleController.text,
      amount: double.tryParse(amountController.text)!,
      date: DateTime.now(),
      category: Category.leisure,
    );
    widget.addExpense(expense);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(label: Text("Enter title")),
            ),
            SizedBox(height: 40),
            TextField(
              controller: amountController,
              decoration: InputDecoration(
                label: Text("Amount"),
                prefix: Text("\$"),
              ),
            ),

            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: onCancel, child: Text("CANCEL")),
                SizedBox(width: 30),
                ElevatedButton(onPressed: onSubmit, child: Text("SUBMIT")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() {
    return _ExpensesScreenState();
  }
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  List<Expense> exp = [...allExpenses];
  void onAddPressed() {
    showModalBottomSheet(
      builder: (context) => ExpenseForm(addExpense: addExpenses),
      context: context,
    );
  }

  void addExpenses(Expense expense) {
    setState(() {
      exp.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => onAddPressed(),
            icon: Icon(Icons.add),
          ),
        ],
        backgroundColor: Colors.blue[700],
        title: const Text('Ronan-The-Best Expenses App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: exp.length,
          itemBuilder: (context, i) {
            final items = exp[i];
            return Dismissible(
              key: Key(items.title),
              onDismissed: (direction) {
                setState(() {
                  exp.removeAt(i);
                });
              },
              direction: DismissDirection.endToStart,
              child: ExpenseCard(expense: items),
            );
          },
        ),
      ),
    );
  }
}
