import 'package:flutter/material.dart';
import 'package:project_musium/pages/Folder.dart'; // Thay thế bằng đường dẫn chính xác
import 'package:project_musium/pages/Artists.dart';
import 'package:project_musium/pages/Playlists.dart';
import 'package:project_musium/pages/Albums.dart';
import 'package:project_musium/pages/Podcast_shows.dart';
import 'package:project_musium/widgets/custom_text_button.dart';
import 'package:project_musium/pages/MainScreen.dart';
class Folders extends StatefulWidget {
  @override
  _FoldersState createState() => _FoldersState();
}

class _FoldersState extends State<Folders> {
  int selectedIndex = 0; // Index mặc định của nút được chọn

  // Danh sách các mục để hiển thị
  final List<Map<String, String>> items = [
    {
      'imagePath': 'assets/images/folders1.png',
      'title': 'moods',
      'subtitle': '11 playlists',
    },
    {
      'imagePath': 'assets/images/folders1.png',
      'title': 'blends',
      'subtitle': '8 playlists',
    },
    {
      'imagePath': 'assets/images/folders1.png',
      'title': 'favs',
      'subtitle': '14 playlists',
    },
    {
      'imagePath': 'assets/images/folders1.png',
      'title': 'random?',
      'subtitle': '10 playlists',
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
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(0),
        child: Scaffold(
          backgroundColor: Color(0xFF121111),
          extendBody: true,
          body: Stack(
              children:[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
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
                        SizedBox(height: 15),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Color(0xFF39C0D4),
                              radius: 25,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.add, color: Colors.black),
                                iconSize: 30,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Add New Playlist',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Color(0xFF39C0D4),
                              radius: 25,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.favorite_border, color: Colors.black),
                                iconSize: 20,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Your Like Songs',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              Icons.import_export,
                              color: Colors.blueGrey,
                              size: 20, // Phóng to Icon
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Recently played',
                              style: TextStyle(
                                  color: Color(0xFF39C0D4),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16),
                            )
                          ],
                        ),
                        SizedBox(height: 15),
                        // Sử dụng danh sách để tạo các mục
                        ...items.map((item) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Folder(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 80,
                                            height: 80,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(item['imagePath']!),
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius: BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item['title']!,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w700),
                                              ),
                                              Text(
                                                item['subtitle']!,
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w700),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                            ],
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                ),
              ]
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
        ),
      ),
    );
  }
}
