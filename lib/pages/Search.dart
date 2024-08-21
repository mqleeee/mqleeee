import 'package:flutter/material.dart';
import 'package:project_musium/pages/MainScreen.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  int _selectedIndex = 0;

  void _onBottomNavItemTapped(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MainScreen(initialIndex: index),
      ),
    );
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121111),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              // Row to align the back button to the start
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    iconSize: 32, // Increase the size of the back arrow icon
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.white,
                  ),
                ],
              ),
              SizedBox(
                  height:
                  20), // Add spacing between the back button and search bar
              // Container for the search bar with white border and search icon on the right
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(25.0),
                  border: Border.all(color: Colors.white, width: 1.5),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Browse Library',
                            hintStyle: TextStyle(color: Colors.white54),
                            border: InputBorder.none,
                          ),
                          onSubmitted: (value) {
                            // Handle search functionality
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.search, color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30), // Space between search bar and the next row
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.import_export,
                    color: Colors.blueGrey,
                    size: 24, // Phóng to Icon
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Recently played',
                    style: TextStyle(
                        color: Color(0xFF39C0D4),
                        fontWeight: FontWeight.w700,
                        fontSize: 16), // Phóng to Text
                  )
                ],
              ),
              SizedBox(height: 30),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      playlistItem(
                          'assets/images/artists1.png', 'Conan Gray', ''),
                      SizedBox(height: 30),
                      playlistItem('assets/images/playlists2.png', 'DAWN FM',
                          'The Weekend',
                          isSquare: true),
                      SizedBox(height: 30),
                      playlistItem('assets/images/search1.png', 'Water Fountain',
                          'alec benjamin',
                          isSquare: true),
                      SizedBox(height: 30),
                      playlistItem('assets/images/library3.png', 'Wiped Out!',
                          'The Neighbourhood',
                          isSquare: true),
                      SizedBox(height: 30),
                      playlistItem('assets/images/podcast3.png', 'Baking a Mystery',
                          'Updated Aug 21• Stephanie Soo',
                          isSquare: true),
                      SizedBox(height: 30),
                      playlistItem('assets/images/artists5.png', 'keshi', ''),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.7), // Màu đen với độ mờ
              spreadRadius: 10, // Phạm vi lan tỏa của bóng
              blurRadius: 20,  // Độ mờ của bóng
              offset: Offset(0, -3), // Vị trí đổ bóng (di chuyển lên trên)
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(1), // Đen đậm phía dưới
              Colors.black.withOpacity(0.0), // Trong suốt phía trên
            ],
          ),
        ),
        child: BottomNavigationBar(
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
          backgroundColor: Colors.transparent, // Làm trong suốt BottomNavigationBar
          elevation: 0,
        ),
      ),
    );
  }

  // Modified playlistItem to accept isSquare parameter
  Widget playlistItem(String imagePath, String title, String subtitle,
      {bool isSquare = false}) {
    return Row(
      children: <Widget>[
        Container(
          width: 90, // Kích thước của hình ảnh
          height: 90,
          decoration: BoxDecoration(
            shape: isSquare
                ? BoxShape.rectangle
                : BoxShape.circle, // Thay đổi hình dạng
            borderRadius: isSquare
                ? BorderRadius.circular(12.0)
                : null, // Bo góc nếu là hình vuông
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 20), // Tăng khoảng cách giữa các cột
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 22, // Phóng to Text
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 17, // Phóng to Text
                fontWeight: FontWeight.w700,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}