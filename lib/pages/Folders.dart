import 'package:flutter/material.dart';
import 'package:project_musium/pages/Folder.dart'; // Thay thế bằng đường dẫn chính xác

class Folders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      backgroundColor: Color(0xFF121111),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
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
      ),
    );
  }
}
