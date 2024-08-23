import 'package:flutter/material.dart';
import 'package:project_musium/pages/CreateNew.dart';
import 'package:project_musium/pages/Play_list1.dart';
import 'package:project_musium/pages/Song.dart';

class AddToPlaylistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08,vertical: screenWidth * 0.06), // Padding theo tỷ lệ màn hình
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF06A0B5).withOpacity(0.4),
                        spreadRadius: 2,
                        blurRadius: 20,
                        offset: Offset(0, 0),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(screenWidth * 0.08), // Bo góc theo tỷ lệ màn hình
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF06A0B5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(screenWidth * 0.08),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.02,
                        horizontal: screenWidth * 0.1,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateNew()));
                    },
                    child: Text(
                      'New Playlist',
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              Container(
                height: screenHeight * 0.06,
                margin: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Find Playlist',
                    hintStyle: TextStyle(
                        color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.05),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.05,
                        vertical: screenHeight * 0.015),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              Expanded(
                child: ListView(
                  children: [
                    playlistItem(
                      context,
                      'current favorites',
                      '20 songs',
                      'assets/images/based2.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlaylistScreen(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    playlistItem(
                      context,
                      '3:00am vibes',
                      '18 songs',
                      'assets/images/library2.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlaylistScreen(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),
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
                    SizedBox(height: screenHeight * 0.02),
                    playlistItem(
                      context,
                      'rain on my window',
                      '32 songs',
                      'assets/images/folderc4.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlaylistScreen(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    playlistItem(
                      context,
                      'Anime OSTs',
                      '20 songs',
                      'assets/images/hinh3.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlaylistScreen(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    playlistItem(
                      context,
                      '3:00am vibes',
                      '21 songs',
                      'assets/images/library2.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlaylistScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget playlistItem(
      BuildContext context, String title, String subtitle, String imagePath,
      {Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.01),
        child: Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.height * 0.08,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.02),
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.03),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    color: Colors.white54,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
