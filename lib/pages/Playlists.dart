import 'package:flutter/material.dart';
import 'package:project_musium/pages/Folders.dart'; // Thay thế bằng đường dẫn chính xác
import 'package:project_musium/pages/Artists.dart';
import 'package:project_musium/pages/Albums.dart';
import 'package:project_musium/pages/Podcast_shows.dart';
import 'package:project_musium/widgets/custom_text_button.dart';
import 'package:project_musium/pages/MainScreen.dart';
class Playlists extends StatefulWidget {
  const Playlists({super.key});

  @override
  State<Playlists> createState() => _PlaylistsState();
}

class _PlaylistsState extends State<Playlists> {
  int selectedIndex = 1; // Index mặc định của nút được chọn

  // Danh sách các mục để hiển thị
  final List<Map<String, String>> items = [
    {
      'imagePath': 'assets/images/playlists1.png',
      'title': 'Superache',
      'subtitle': 'Conan Gray',
    },
    {
      'imagePath': 'assets/images/playlists2.png',
      'title': 'DAWN FM',
      'subtitle': 'The Weekend',
    },
    {
      'imagePath': 'assets/images/playlists3.png',
      'title': 'Planet Her',
      'subtitle': 'Doja Cat',
    },
    {
      'imagePath': 'assets/images/library3.png',
      'title': 'Wiped Out!',
      'subtitle': 'The Neighbourhood',
    },
    {
      'imagePath': 'assets/images/playlists5.png',
      'title': 'Bloom',
      'subtitle': 'Troye Sivan',
    },
  ];

  final List<Widget> pages = [
    Folders(),
    Playlists(),
    Artists(),
    Albums(),
    Podcasts_Shows(),
  ];

  void _onTextButtonPressed(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  int _selectedIndex = 2;
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
      backgroundColor: Color(0xFF121111),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        image: AssetImage('assets/images/logo1.png'),
                        width: 60,
                        height: 60,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Your Library',
                        style: TextStyle(
                          color: Color(0xFF06A0B5),
                          fontSize: 27,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.search, size: 30, color: Colors.white),
                        onPressed: () {
                          // Xử lý tìm kiếm
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CustomTextButton(
                          label: 'Folders',
                          isSelected: selectedIndex == 0,
                          onPressed: () => _onTextButtonPressed(0),
                          destinationPage: Folders(),
                          libraryPage: MainScreen(initialIndex: 2),
                        ),
                        SizedBox(width: 20),
                        CustomTextButton(
                          label: 'Playlists',
                          isSelected: selectedIndex == 1,
                          onPressed: () => _onTextButtonPressed(1),
                          destinationPage: Playlists(),
                          libraryPage: MainScreen(initialIndex: 2),
                        ),
                        SizedBox(width: 20),
                        CustomTextButton(
                          label: 'Artists',
                          isSelected: selectedIndex == 2,
                          onPressed: () => _onTextButtonPressed(2),
                          destinationPage: Artists(),
                          libraryPage: MainScreen(initialIndex: 2),
                        ),
                        SizedBox(width: 20),
                        CustomTextButton(
                          label: 'Albums',
                          isSelected: selectedIndex == 3,
                          onPressed: () => _onTextButtonPressed(3),
                          destinationPage: Albums(),
                          libraryPage: MainScreen(initialIndex: 2),
                        ),
                        SizedBox(width: 20),
                        CustomTextButton(
                          label: 'Podcasts & Shows',
                          isSelected: selectedIndex == 4,
                          onPressed: () => _onTextButtonPressed(4),
                          destinationPage: Podcasts_Shows(),
                          libraryPage: MainScreen(initialIndex: 2),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0xFF39C0D4),
                        radius: 25, // Phóng to CircleAvatar
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite_border, color: Colors.black),
                          iconSize: 20, // Phóng to Icon
                        ),
                      ),
                      SizedBox(width: 20), // Tăng khoảng cách giữa các cột
                      Text(
                        'Your Liked Playlists',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18, // Phóng to Text
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 30), // Tăng khoảng cách giữa các dòng
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.import_export,
                        color: Colors.blueGrey,
                        size: 20, // Phóng to Icon
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Recently added',
                        style: TextStyle(
                            color: Color(0xFF39C0D4),
                            fontWeight: FontWeight.w700,
                            fontSize: 16), // Phóng to Text
                      )
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 30),
                          playlistItem('assets/images/playlists1.png', 'Superache',
                              'Conan Gray'),
                          SizedBox(height: 30),
                          playlistItem('assets/images/playlists2.png', 'DAWN FM',
                              'The Weekend'),
                          SizedBox(height: 30),
                          playlistItem('assets/images/playlists3.png', 'Planet Her',
                              'Doja Cat'),
                          SizedBox(height: 30),
                          playlistItem('assets/images/library3.png', 'Wiped Out!',
                              'The Neighbourhood'),
                          SizedBox(height: 30),
                          playlistItem('assets/images/playlists5.png', 'Bloom',
                              'Troye Sivan'),
                        ],
                      ),
                    ),
                  ),
                ],
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

  Widget playlistItem(String imagePath, String title, String subtitle) {
    return Row(
      children: <Widget>[
        Container(
          width: 90, // Phóng to hình ảnh
          height: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
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
