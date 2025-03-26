import 'package:flutter/material.dart';
import 'add_expense_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, String>> expenses = []; 

  void addExpense(String name, String amount, String date) {
    setState(() {
      expenses.add({
        'name': name,
        'amount': amount,
        'date': date,
      }); 
    });
  }
  double getTotalAmount() {
    double total = 0.0;
    for (var expense in expenses) {
      total += double.tryParse(expense['amount']!) ?? 0.0; 
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.yellow,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(), 
            Text(
              'Welcome to PennyWise!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center, 
            ),
            SizedBox(height: 20),
            Text(
              'Your Expenses:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: expenses.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(expenses[index]['name']!),
                    subtitle: Text(
                      'KES ${expenses[index]['amount']} on ${expenses[index]['date']}',
                    ), // Show date
                    trailing: Icon(Icons.delete, color: Colors.red),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Total Amount: KES ${getTotalAmount().toStringAsFixed(2)}', 
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => AddExpenseScreen(
                          onAddExpense: addExpense,
                        ),
                  ),
                );
              },
              child: Text('Add Expense'),
            ),
          ],
        ),
      ),
    );
  }
}
