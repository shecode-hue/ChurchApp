import 'dart:convert'; // Importing the dart:convert library for JSON encoding/decoding

import 'package:flutter/material.dart'; // Importing the material package from Flutter
import 'package:http/http.dart'
    as http; // Importing the http package for making HTTP requests

// AddFinancePage class, which is a StatefulWidget
class AddFinancePage extends StatefulWidget {
  @override
  _AddFinancePageState createState() =>
      _AddFinancePageState(); // Creating a state for AddFinancePage
}

// State class associated with AddFinancePage
class _AddFinancePageState extends State<AddFinancePage> {
  // Text editing controllers for various text fields
  late TextEditingController _transactionDateController;
  late TextEditingController _pastoralFundController;
  late TextEditingController _offeringsController;
  late TextEditingController _thanksgivingController;
  late TextEditingController _titheController;
  late TextEditingController _membershipController;
  late TextEditingController _stationaryController;
  late TextEditingController _devotionsController;

  late http.Client httpClient; // HTTP client for making requests

  @override
  void initState() {
    super.initState();
    // Initialize text editing controllers
    _transactionDateController = TextEditingController();
    _pastoralFundController = TextEditingController();
    _offeringsController = TextEditingController();
    _thanksgivingController = TextEditingController();
    _titheController = TextEditingController();
    _membershipController = TextEditingController();
    _stationaryController = TextEditingController();
    _devotionsController = TextEditingController();
  }

  // Function to insert a new record
  void insertRecord(Map<String, dynamic> financeData) async {
    // Convert the data to JSON
    String jsonData = json.encode(financeData);

    try {
      // Make the HTTP POST request to the PHP script
      var response = await http.post(
        Uri.parse('add_finances.php'),
        body: jsonData,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Record inserted successfully
        print('Record inserted successfully');
        // Navigate back to the previous page with a success message
        Navigator.pop(context, 'Successfully inserted');
      } else {
        // Handle error
        print('Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      // Handle exception
      print('Exception: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('New Finance Record'), // Displaying the title of the app bar
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(
                  context); // Pop the current route from the navigation stack when close icon is pressed
            },
            icon: const Icon(Icons.close), // Displaying close icon
          ),
        ],
      ),
      // Body of the Scaffold, containing a SingleChildScrollView with a Form
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // TextFormField for Transaction Date
                TextFormField(
                  controller: _transactionDateController,
                  decoration: const InputDecoration(labelText: 'Transaction Date'),
                ),
                // TextFormField for Pastoral Fund
                TextFormField(
                  controller: _pastoralFundController,
                  decoration: const InputDecoration(labelText: 'Pastoral Fund'),
                ),
                // TextFormField for Offerings
                TextFormField(
                  controller: _offeringsController,
                  decoration: const InputDecoration(labelText: 'Offerings'),
                ),
                // TextFormField for Thanksgiving
                TextFormField(
                  controller: _thanksgivingController,
                  decoration: const InputDecoration(labelText: 'Thanksgiving'),
                ),
                // TextFormField for Tithe
                TextFormField(
                  controller: _titheController,
                  decoration: const InputDecoration(labelText: 'Tithe'),
                ),
                // TextFormField for Membership
                TextFormField(
                  controller: _membershipController,
                  decoration: const InputDecoration(labelText: 'Membership'),
                ),
                // TextFormField for Stationary
                TextFormField(
                  controller: _stationaryController,
                  decoration: const InputDecoration(labelText: 'Stationary'),
                ),
                // TextFormField for Devotions
                TextFormField(
                  controller: _devotionsController,
                  decoration: const InputDecoration(labelText: 'Devotions'),
                ),
                const SizedBox(height: 20), // Adding vertical spacing
                // ElevatedButton for saving the record
                ElevatedButton(
                  onPressed: () {
                    // Call insertRecord function with finance data when Save button is pressed
                    insertRecord({
                      'TransactionDate': _transactionDateController.text,
                      'PastoralFund': _pastoralFundController.text,
                      'Offerings': _offeringsController.text,
                      'Thanksgiving': _thanksgivingController.text,
                      'Tithe': _titheController.text,
                      'Membership': _membershipController.text,
                      'Stationary': _stationaryController.text,
                      'Devotions': _devotionsController.text,
                    });
                  },
                  child: const Text('Save'), // Text for Save button
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose text editing controllers when the widget is disposed
    _transactionDateController.dispose();
    _pastoralFundController.dispose();
    _offeringsController.dispose();
    _thanksgivingController.dispose();
    _titheController.dispose();
    _membershipController.dispose();
    _stationaryController.dispose();
    _devotionsController.dispose();
    super.dispose();
  }
}
