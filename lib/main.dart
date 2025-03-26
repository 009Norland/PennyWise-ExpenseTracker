import 'package:flutter/material.dart';
import 'package:trial_tracker3/screens/login_screen.dart';
import 'login_screen.dart';
import 'signup_screen.dart';

void main() {
  runApp(ExpenseTrackerApp());

}

class ExpenseTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
