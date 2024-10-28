import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  var enteredTitle = '';

  void _saveTitle(String inputText) {
    enteredTitle = inputText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            maxLength: 50,
            onChanged: _saveTitle,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    print(enteredTitle);
                  },
                  child: const Text("Save Expense")),
            ],
          )
        ],
      ),
    );
  }
}
