import 'package:flutter/material.dart';
import 'package:project_musium/pages/Play_list1.dart';
import 'package:project_musium/pages/Song.dart';


class AddToPlaylistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121111),
      appBar: AppBar(
        backgroundColor: Color(0xFF121111),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SongScreen()),
            );
          },
        ),
        title: Text(
          'Add to Playlist',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w700
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child:  Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF06A0B5).withOpacity(0.4), // Màu của đổ bóng
                        spreadRadius: 2, // Bán kính lan của đổ bóng
                        blurRadius: 20, // Độ mờ của đổ bóng
                        offset: Offset(0, 0), // Độ dịch chuyển của đổ bóng
                      ),
                    ],
                    borderRadius: BorderRadius.circular(30.0), // Bo góc cho bóng
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF06A0B5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 32.0,
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'New Playlist',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Container(
                height: 50,
                margin: EdgeInsets.symmetric(
                    vertical: 10.0), // Thêm khoảng cách trên/dưới
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Find Playlist',
                    hintStyle: TextStyle(
                        color: Colors.grey), // Màu của văn bản gợi ý
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey, // Màu của biểu tượng tìm kiếm
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none, // Loại bỏ đường viền
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15), // Thêm khoảng cách nội dung
                  ),
                ),
              ),
              SizedBox(height: 40),
              Expanded(
                child: ListView(
                  children: [
                    playlistItem(
                      context,
                      'current favorites',
                      '20 songs',
                      'assets/images/based2.png',
                      onTap: () {
                        // Handle item tap if needed
                      },
                    ),
                    SizedBox(height: 16),
                    playlistItem(
                      context,
                      '3:00am vibes',
                      '18 songs',
                      'assets/images/library2.png',
                      onTap: () {
                        // Handle item tap if needed
                      },
                    ),
                    SizedBox(height: 16),
                    playlistItem(
                      context,
                      'Lofi Loft',
                      '63 songs',
                      'assets/images/folderc1.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlaylistScreen(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 16),
                    playlistItem(
                      context,
                      'rain on my window',
                      '32 songs',
                      'assets/images/folderc4.png',
                      onTap: () {
                        // Handle item tap if needed
                      },
                    ),
                    SizedBox(height: 16),
                    playlistItem(
                      context,
                      'Anime OSTs',
                      '20 songs',
                      'assets/images/hinh3.png',
                      onTap: () {
                        // Handle item tap if needed
                      },
                    ),
                    SizedBox(height: 16),
                    playlistItem(
                      context,
                      '3:00am vibes',
                      '21 songs',
                      'assets/images/library2.png',
                      onTap: () {
                        // Handle item tap if needed
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }

  Widget playlistItem(
      BuildContext context, String title, String subtitle, String imagePath,
      {Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white54,
                  ),
                ),
              ],
            ),
            Spacer(),
            Icon(Icons.more_vert, color: Colors.white),
          ],
        ),
      ),
    );
  }
}