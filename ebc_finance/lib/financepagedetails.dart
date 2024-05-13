import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// FinanceDetailsPage class, which is a StatefulWidget
class FinanceDetailsPage extends StatefulWidget {
  final Map<String, dynamic> finance;

  const FinanceDetailsPage({Key? key, required this.finance}) : super(key: key);

  @override
  _FinanceDetailsPageState createState() => _FinanceDetailsPageState();
}

// State class associated with FinanceDetailsPage
class _FinanceDetailsPageState extends State<FinanceDetailsPage> {
  // Controllers for text fields
  late TextEditingController _transactionIdController;
  late TextEditingController _transactionDateController;
  late TextEditingController _pastoralFundController;
  late TextEditingController _offeringsController;
  late TextEditingController _thanksgivingController;
  late TextEditingController _titheController;
  late TextEditingController _membershipController;
  late TextEditingController _stationaryController;
  late TextEditingController _devotionsController;

  late http.Client httpClient;

  // Flag to indicate if the page is in editing mode
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    // Initialize text field controllers with finance data
    _transactionIdController =
        TextEditingController(text: widget.finance['TransactionID']);
    _transactionDateController =
        TextEditingController(text: widget.finance['TransactionDate']);
    _pastoralFundController =
        TextEditingController(text: widget.finance['PastoralFund']);
    _offeringsController =
        TextEditingController(text: widget.finance['Offerings']);
    _thanksgivingController =
        TextEditingController(text: widget.finance['Thanksgiving']);
    _titheController = TextEditingController(text: widget.finance['Tithe']);
    _membershipController =
        TextEditingController(text: widget.finance['Membership']);
    _stationaryController =
        TextEditingController(text: widget.finance['Stationary']);
    _devotionsController =
        TextEditingController(text: widget.finance['Devotions']);
  }

  // Function to send updated data to the server
  void sendUpdatedData(Map<String, dynamic> updatedFinance) async {
    // Convert the data to JSON
    String jsonData = json.encode(updatedFinance);

    try {
      // Make the HTTP POST request to update the finance data
      var response = await http.post(
        Uri.parse('update_finance.php'),
        body: jsonData,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Data updated successfully
        print('Data updated successfully');
        setState(() {
          _isEditing = false;
        });
        // Navigate back to the previous page with a success message
        Navigator.pop(context, 'Successfully edited');
      } else {
        // Handle error
        print('Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      // Handle exception
      print('Exception: $e');
    }
  }

  // Function to delete the record
  void deleteRecord() async {
    try {
      // Make the HTTP POST request to delete the record
      var response = await http.post(
        Uri.parse('delete_finance.php'),
        body: json.encode({'TransactionID': _transactionIdController.text}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Record deleted successfully
        print('Record deleted successfully');
        // Navigate back to the main page
        Navigator.pop(context, 'Record deleted');
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
            const Text('Transaction Details'), // Displaying the title of the app bar
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
                TextFormField(
                  controller: _transactionIdController,
                  decoration: const InputDecoration(
                      labelText:
                          'Transaction ID'),
                           // Label for Transaction ID field
                  enabled:
                      _isEditing, // Enable/disable editing based on _isEditing flag
                ),
                TextFormField(
                  controller: _transactionDateController,
                  decoration: const InputDecoration(
                      labelText:
                          'Transaction Date'), // Label for Transaction Date field
                  enabled:
                      _isEditing, // Enable/disable editing based on _isEditing flag
                ),
                  TextFormField(
                  controller: _transactionDateController,
                  decoration: const InputDecoration(labelText: 'Transaction Date'),
                  enabled: _isEditing,
                ),
                TextFormField(
                  controller: _pastoralFundController,
                  decoration: const InputDecoration(labelText: 'Pastoral Fund'),
                  enabled: _isEditing,
                ),
                TextFormField(
                  controller: _offeringsController,
                  decoration: const InputDecoration(labelText: 'Offerings'),
                  enabled: _isEditing,
                ),
                TextFormField(
                  controller: _thanksgivingController,
                  decoration: const InputDecoration(labelText: 'Thanksgiving'),
                  enabled: _isEditing,
                ),
                TextFormField(
                  controller: _titheController,
                  decoration: const InputDecoration(labelText: 'Tithe'),
                  enabled: _isEditing,
                ),
                TextFormField(
                  controller: _membershipController,
                  decoration: const InputDecoration(labelText: 'Membership'),
                  enabled: _isEditing,
                ),
                TextFormField(
                  controller: _stationaryController,
                  decoration: const InputDecoration(labelText: 'Stationary'),
                  enabled: _isEditing,
                ),
                TextFormField(
                  controller: _devotionsController,
                  decoration: const InputDecoration(labelText: 'Devotions'),
                  enabled: _isEditing,
                ),
                TextFormField(
                  enabled: false, // Total Amount field disabled for editing
                  initialValue: widget.finance['TotalAmount'].toString(),
                  decoration: const InputDecoration(labelText: 'Total Amount'),
                ),
                const SizedBox(height: 20), // Adding vertical spacing
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isEditing =
                          true; // Set _isEditing to true to enable editing
                    });
                  },
                  child: const Text('Edit Record'), // Text for Edit Record button
                ),
                const SizedBox(height: 10), // Adding vertical spacing
                ElevatedButton(
                  onPressed: () {
                    deleteRecord(); // Call deleteRecord function when Delete Record button is pressed
                  },
                  child: const Text('Delete Record'), // Text for Delete Record button
                ),
                const SizedBox(height: 10), // Adding vertical spacing
                ElevatedButton(
                  onPressed: () {
                    // Call sendUpdatedData function with updated finance data when Save button is pressed
                    sendUpdatedData({
                      'TransactionID': _transactionIdController.text,
                      'TransactionDate': _transactionDateController.text,
                      'PastoralFund': _pastoralFundController.text,
                      'Offerings': _offeringsController.text,
                      'Thanksgiving': _thanksgivingController.text,
                      'Tithe': _titheController.text,
                      'Membership': _membershipController.text,
                      'Stationary': _stationaryController.text,
                      'Devotions': _devotionsController.text,
                      'TotalAmount': widget.finance['TotalAmount'],
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
    // Dispose text field controllers when the widget is disposed
    _transactionIdController.dispose();
    _transactionDateController.dispose();
    _pastoralFundController.dispose();
    _offeringsController.dispose();
    _thanksgivingController.dispose();
    _titheController.dispose();
    _membershipController.dispose();
    _stationaryController.dispose();
    _devotionsController.dispose();
    // Dispose other controllers...
    super.dispose();
  }
}
