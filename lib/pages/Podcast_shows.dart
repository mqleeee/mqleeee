import 'package:flutter/material.dart';
import 'package:project_musium/pages/Folders.dart'; // Thay thế bằng đường dẫn chính xác
import 'package:project_musium/pages/Playlists.dart';
import 'package:project_musium/pages/Artists.dart';
import 'package:project_musium/pages/Albums.dart';
import 'package:project_musium/widgets/custom_text_button.dart';
import 'package:project_musium/pages/MainScreen.dart';

class Podcasts_Shows extends StatefulWidget {
  const Podcasts_Shows({super.key});

  @override
  State<Podcasts_Shows> createState() => _Podcasts_ShowsState();
}

class _Podcasts_ShowsState extends State<Podcasts_Shows> {
  int selectedIndex = 4; // Index mặc định của nút được chọn

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
              SizedBox(height: 20),
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
                    'Your Liked Podcasts',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18, // Phóng to Text
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
                    size: 24,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'A - Z',
                    style: TextStyle(
                        color: Color(0xFF39C0D4),
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 30),
                      playlistItem('assets/images/hinh6.png', 'Anything Goes',
                          'Updated Aug 31 • Emma Chamberlain'),
                      SizedBox(height: 30),
                      playlistItem('assets/images/podcast1.png', 'Ask Me Another',
                          'Updated Aug 18 • NPR Studios'),
                      SizedBox(height: 30),
                      playlistItem('assets/images/podcast3.png', 'Baking a Mystery',
                          'Updated Aug 21• Stephanie Soo'),
                      SizedBox(height: 30),
                      playlistItem('assets/images/library4.png', 'Extra Dynamic',
                          'Updated Aug 10 • ur mom ashley'),
                      SizedBox(height: 30),
                      playlistItem('assets/images/podcast4.jpg', 'Teenager Therapy',
                          'Updated Aug 21• iHeart Studios'),
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

  Widget playlistItem(String imagePath, String title, String subtitle) {
    return Row(
      children: <Widget>[
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Column(
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
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
