import 'package:flutter/material.dart';
import 'package:project_musium/pages/Explore.dart';
import 'package:project_musium/pages/Library.dart';
import 'package:project_musium/pages/Home_page.dart';

class MainScreen extends StatefulWidget {
  final int initialIndex;
  const MainScreen({super.key, this.initialIndex = 0});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // Danh sách các trang
  final List<Widget> _pages = [
    HomePage(), // Trang HomePage
    Explore(), // Trang Explore
    Library(), // Trang Library
  ];

  _MainScreenState() : _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex; // Cập nhật chỉ số ban đầu
  }

  void _onBottomNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ), // Hiển thị trang tương ứng với tab được chọn
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder_outlined),
            label: 'Library',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF06A0B5), // Màu của mục được chọn
        unselectedItemColor: Colors.grey, // Màu của các mục chưa được chọn
        onTap: _onBottomNavItemTapped, // Gọi hàm khi mục được chọn
        backgroundColor: Colors.transparent, // Màu nền của bottom bar
        elevation: 0,
      ),
    );
  }
}
