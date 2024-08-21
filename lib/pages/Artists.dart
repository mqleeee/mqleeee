import 'package:flutter/material.dart';
import 'package:project_musium/pages/Folders.dart'; // Thay thế bằng đường dẫn chính xác
import 'package:project_musium/pages/Playlists.dart';
import 'package:project_musium/pages/Albums.dart';
import 'package:project_musium/pages/Podcast_shows.dart';
import 'package:project_musium/widgets/custom_text_button.dart';
import 'package:project_musium/pages/MainScreen.dart';

class Artists extends StatefulWidget {
  const Artists({super.key});

  @override
  State<Artists> createState() => _ArtistsState();
}

class _ArtistsState extends State<Artists> {
  int selectedIndex = 2; // Index mặc định của nút được chọn

  void _onTextButtonPressed(int index) {
    setState(() {
      selectedIndex = index;
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
              SizedBox(height: 20),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // Thêm chữ "Sort By"
                  Text(
                    'Sort By',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Tiêu đề "Recently added"
                  Row(
                    children: <Widget>[
                      SizedBox(width: 10),
                      Text(
                        'Recently added',
                        style: TextStyle(
                            color: Color(0xFF39C0D4),
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                      Icon(
                        Icons.import_export,
                        color: Colors.blueGrey,
                        size: 24,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      playlistItem('assets/images/artists1.png', 'Conan Gray'),
                      SizedBox(height: 30),
                      playlistItem('assets/images/artists2.png', 'Chase Atlantic'),
                      SizedBox(height: 30),
                      playlistItem('assets/images/artists3.png', 'beabadoobee'),
                      SizedBox(height: 30),
                      playlistItem('assets/images/explore1.png', 'New Jeans'),
                      SizedBox(height: 30),
                      playlistItem('assets/images/artists5.png', 'keshi'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget playlistItem(String imagePath, String title) {
    return Row(
      children: <Widget>[
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
