import 'package:flutter/material.dart';

class AddExpenseScreen extends StatelessWidget {
  final TextEditingController expenseNameController = TextEditingController();
  final TextEditingController expenseAmountController = TextEditingController();
  final TextEditingController expenseDateController =
      TextEditingController(); 
  final Function(String, String, String)
  onAddExpense; 

  AddExpenseScreen({
    required this.onAddExpense,
  }); 

  void addExpense(BuildContext context) {
    final String name = expenseNameController.text;
    final String amount = expenseAmountController.text;
    final String date = expenseDateController.text;

    if (name.isNotEmpty && amount.isNotEmpty && date.isNotEmpty) {
      onAddExpense(name, amount, date);
      Navigator.pop(context); 
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please fill in all fields')));
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      expenseDateController.text =
          "${pickedDate.toLocal()}".split(' ')[0]; 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Expense'),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.yellow,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: expenseNameController,
              decoration: InputDecoration(
                labelText: 'Expense Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: expenseAmountController,
              decoration: InputDecoration(
                labelText: 'Amount (KES)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number, 
            ),
            SizedBox(height: 16),
            TextField(
              controller: expenseDateController,
              decoration: InputDecoration(
                labelText: 'Date',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () => selectDate(context), 
                ),
              ),
              readOnly: true, 
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => addExpense(context),
              child: Text('Add Expense'),
            ),
          ],
        ),
      ),
    );
  }
}
