import 'package:flutter/material.dart';
import 'home_page.dart'; // Import the Home page
import 'add_page.dart'; // Import the Add Post page
import 'profil_page.dart'; // Import the Profile page

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Media App', // Title of the app
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.blue), // Theme color
        useMaterial3: true,
      ),
      home: const TabsPage(), // The main page with bottom navigation
      debugShowCheckedModeBanner: false, // Remove debug banner
    );
  }
}

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _selectedIndex = 0; // Index of the selected tab

  // List of widgets for each page
  final List<Widget> _widgetOptions = [
    const HomePage(), // Home page
    const AddPage(), // Add Post page
    const ProfilPage(), // Profile page
  ];

  // List of titles for each page
  final List<String> _widgetTitle = [
    'Accueil', // Title for Home page
    'Ajouter un post', // Title for Add Post page
    'Profil', // Title for Profile page
  ];

  // Function to handle tab selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_widgetTitle[_selectedIndex]), // Dynamic app bar title
      ),
      body: Center(
        child: _widgetOptions[_selectedIndex], // Display the selected page
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Home icon
            label: 'Accueil', // Home label
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add), // Add Post icon
            label: 'Ajouter', // Add Post label
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // Profile icon
            label: 'Profil', // Profile label
          ),
        ],
        currentIndex: _selectedIndex, // Current selected tab
        selectedItemColor: Colors.blue[800], // Color of the selected tab
        onTap: _onItemTapped, // Callback when a tab is tapped
      ),
    );
  }
}
