import 'package:flutter/material.dart';
import 'package:flutter_tracker/models/expense.dart';
import 'package:flutter_tracker/widgets/expenses_list/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      category: Category.work,
      date: DateTime.now(),
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      category: Category.leisure,
      date: DateTime.now(),
    ),
  ];

  void _addExpense(Expense expense) {
    setState(() {
      _registredExpenses.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expenses"),
      ),
      body: Column(
        children: [
          const Text("Expenses"),
          Expanded(
            child: ExpensesList(expenses: _registredExpenses),
          )
        ],
      ),
    );
  }
}
