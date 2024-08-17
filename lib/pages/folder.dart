import 'package:flutter/material.dart';
import 'package:project_musium/pages/MainScreen.dart'; // Import MainScreen

class Folder extends StatefulWidget {
  const Folder({super.key});

  @override
  State<Folder> createState() => _FolderState();
}

class _FolderState extends State<Folder> {
  int _selectedIndex = 0;

  void _onBottomNavItemTapped(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MainScreen(initialIndex: index), // Truyền chỉ số điều hướng
      ),
    );
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Folder'),
        backgroundColor: Color(0xFF39C0D4),
      ),
      body: Center(
        child: Text(
          'Folder Content',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.playlist_play),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder_outlined),
            label: 'Library',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF06A0B5),
        unselectedItemColor: Colors.grey,
        onTap: _onBottomNavItemTapped,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Color(0xFF121111),
    );
  }
}
