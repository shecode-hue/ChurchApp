import 'package:flutter/material.dart';

// ExpensesPage class, which is a StatelessWidget
class ExpensesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Returning a Scaffold widget
    return const Scaffold(
      // Body of the Scaffold, containing a SingleChildScrollView with a Column
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Text widget displaying "All EBC Expenses"
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'All EBC Expenses',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Creating ExpenseCard widgets with different expenses
            ExpenseCard(
              title: 'Electricity Bill',
              amount: 500,
              category: 'Utilities',
            ),
            ExpenseCard(
              title: 'Gas Bill',
              amount: 300,
              category: 'Utilities',
            ),
            ExpenseCard(
              title: 'Office Supplies',
              amount: 100,
              category: 'Supplies',
            ),
            ExpenseCard(
              title: 'Maintenance',
              amount: 700,
              category: 'Maintenance',
            ),
            ExpenseCard(
              title: 'Cleaning Services',
              amount: 400,
              category: 'Services',
            ),
            ExpenseCard(
              title: 'Rent',
              amount: 1500,
              category: 'Rent',
            ),
            ExpenseCard(
              title: 'Repairs',
              amount: 800,
              category: 'Maintenance',
            ),
            ExpenseCard(
              title: 'Transportation',
              amount: 200,
              category: 'Services',
            ),
            ExpenseCard(
              title: 'Miscellaneous',
              amount: 300,
              category: 'Misc',
            ),
          ],
        ),
      ),
    );
  }
}

// ExpenseCard class, which is a StatelessWidget
class ExpenseCard extends StatelessWidget {
  final String title; // Title of the expense
  final double amount; // Amount of the expense
  final String category; // Category of the expense

  const ExpenseCard({
    required this.title,
    required this.amount,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    // Creating a Card widget to display expense details
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(title), // Displaying the title of the expense
        subtitle: Text(
            'Category: $category'), // Displaying the category of the expense
        trailing: Text('N\$ $amount'), // Displaying the amount of the expense
      ),
    );
  }
}
