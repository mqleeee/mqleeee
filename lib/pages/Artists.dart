import 'package:flutter/material.dart';

class Artists extends StatefulWidget {
  const Artists({super.key});

  @override
  State<Artists> createState() => _ArtistsState();
}

class _ArtistsState extends State<Artists> {
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
                            fontSize: 16), // Phóng to Text
                      ),
                      Icon(
                        Icons.import_export,
                        color: Colors.blueGrey,
                        size: 24, // Phóng to Icon
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
                      playlistItem(
                          'assets/images/artists1.png', 'Conan Gray'),
                      SizedBox(height: 30),
                      playlistItem(
                          'assets/images/artists2.png', 'Chase Atlantic'),
                      SizedBox(height: 30),
                      playlistItem(
                          'assets/images/artists3.png', 'beabadoobee'),
                      SizedBox(height: 30),
                      playlistItem(
                          'assets/images/explore1.png', 'New Jeans'),
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
          width: 90, // Kích thước của hình ảnh
          height: 90,
          decoration: BoxDecoration(
            shape: BoxShape.circle, // Thay đổi thành hình tròn
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

          ],
        ),
      ],
    );
  }
}