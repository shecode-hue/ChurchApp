import 'dart:convert';
import 'package:ebc_finance/addnew.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'financepagedetails.dart';

// FinancePage class, which is a StatefulWidget
class FinancePage extends StatefulWidget {
  @override
  _FinancePageState createState() => _FinancePageState();
}

// State class associated with FinancePage
class _FinancePageState extends State<FinancePage> {
  // List to store financial data
  List<Map<String, dynamic>> _finances = [];
  // Flag to indicate if data is loading
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // Call function to fetch data when the widget is initialized
    fetchData();
  }

  // Function to fetch financial data
  Future<void> fetchData() async {
    setState(() {
      _isLoading = true; // Set loading flag to true
    });

    // Making HTTP request to fetch data
    final response = await http
        .get(Uri.parse('xyz.php'));

    if (response.statusCode == 200) {
      // Check if request was successful
      setState(() {
        // Update finances list with decoded JSON data
        _finances = List<Map<String, dynamic>>.from(json.decode(response.body));
        _isLoading = false; // Set loading flag to false
      });
    } else {
      setState(() {
        _isLoading = false; // Set loading flag to false
      });
      throw Exception('Failed to load data'); // Throw error if request failed
    }
  }

  // Function to refresh data
  Future<void> _refreshData() async {
    await fetchData(); // Call fetchData to refresh data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refreshData, // Handle refresh action
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Sunday Service Finances',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: _isLoading
                  ? const Center(
                      child:
                          CircularProgressIndicator(), // Show loading indicator if data is loading
                    )
                  : _finances.isEmpty
                      ? const Center(
                          child: Text(
                              'No data available'), // Show message if no data is available
                        )
                      : ListView.builder(
                          itemCount: _finances.length,
                          itemBuilder: (context, index) {
                            final finance = _finances.reversed.toList()[index];
                            return Card(
                              child: ListTile(
                                title: Text(finance[
                                    'TransactionDate']), // Display transaction date
                                subtitle: Text(
                                    'Total Amount:N\$ ${finance['TotalAmount']}'), // Display total amount
                                onTap: () {
                                  // Navigate to finance details page when tapped
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FinanceDetailsPage(
                                          finance:
                                              finance), // Pass finance data to details page
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
      // Floating action button to add new finance entry
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to add finance page when button is pressed
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddFinancePage(),
            ),
          );
        },
        child: const Icon(Icons.add), // Display add icon on the button
      ),
    );
  }
}
