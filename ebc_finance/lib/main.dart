import 'package:ebc_finance/ExpensesPage.dart';
import 'package:ebc_finance/FinancePage.dart';
import 'package:ebc_finance/HomePage.dart';
import 'package:ebc_finance/SettingsPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Setting the color scheme for the app
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // Using Material 3 design
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'EBC finances app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Index of the currently selected page in the bottom navigation bar
  int _selectedIndex = 0;

  // List of pages to be shown based on the bottom navigation bar selection
  static List<Widget> _pages = <Widget>[
    HomePage(),
    FinancePage(),
    ExpensesPage(),
    SettingsPage(),
  ];

  // Function to handle bottom navigation bar item tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Setting the background color of the app bar
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Displaying the title passed from MyApp widget
        title: Text(widget.title),
      ),
      // Displaying the selected page based on the current index
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        // Setting the background color of the bottom navigation bar
        backgroundColor: const Color.fromARGB(255, 139, 93, 224),
        // Setting the color of selected item in the bottom navigation bar
        selectedItemColor: const Color.fromARGB(255, 139, 93, 224),
        // Setting the color of unselected items in the bottom navigation bar
        unselectedItemColor: Colors.black,

        // Defining the items for the bottom navigation bar
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Finance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: 'Expenses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        // Setting the current index based on the selected item
        currentIndex: _selectedIndex,
        // Handling tap on bottom navigation bar items
        onTap: _onItemTapped,
      ),
    );
  }
}
