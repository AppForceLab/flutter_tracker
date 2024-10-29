import 'package:flutter/material.dart';
import 'package:flutter_tracker/models/expense.dart';
import 'package:flutter_tracker/widgets/chart/chart.dart';
import 'package:flutter_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:flutter_tracker/widgets/new_expense.dart';

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

  void _removeExpense(Expense expense) {
    final expenseIndex = _registredExpenses.indexOf(expense);
    setState(() {
      _registredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text("Expense deleted."),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _registredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: _addExpense,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text("No expenses found. Start adding some!"),
    );
    if (_registredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
          expenses: _registredExpenses, onRemoveExpense: _removeExpense);
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Expense Tracker"), actions: [
        IconButton(
          onPressed: _openAddExpenseOverlay,
          icon: const Icon(Icons.add),
        )
      ]),
      body: Column(
        children: [
          Chart(expenses: _registredExpenses),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
