import 'package:flutter/material.dart';
import 'package:project_musium/pages/Folders.dart';
import 'package:project_musium/pages/MainScreen.dart';
import 'package:project_musium/pages/Play_list1.dart';

class Folder extends StatefulWidget {
  const Folder({super.key});

  @override
  State<Folder> createState() => _FolderState();
}

class _FolderState extends State<Folder> {
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: screenWidth * 0.06),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Folders()));
          },
          color: Colors.white,
        ),
        title: Text(
          'Moods',
          style: TextStyle(
            fontSize: screenWidth * 0.05,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sort By',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: Colors.white54,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Recently played',
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            color: Colors.cyan,
                          ),
                        ),
                        Icon(
                          Icons.import_export,
                          color: Colors.white54,
                          size: screenWidth * 0.05,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: screenHeight * 0.05),
                Expanded(
                  child: ListView(
                    children: [
                      addNewPlaylist(screenWidth),
                      folderItem('current favorites', '20 songs',
                          'assets/images/based2.png', screenWidth, context),
                      folderItem('3:00am vibes', '18 songs',
                          'assets/images/library2.png', screenWidth, context),
                      folderItem('Lofi Loft', '63 songs',
                          'assets/images/folderc1.png', screenWidth, context),
                      folderItem('rain on my window', '32 songs',
                          'assets/images/folderc4.png', screenWidth, context),
                      folderItem('Anime OSTs', '20 songs',
                          'assets/images/hinh3.png', screenWidth, context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.7),
              spreadRadius: 10,
              blurRadius: 20,
              offset: Offset(0, -3),
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(1),
              Colors.black.withOpacity(0.0),
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
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      backgroundColor: Color(0xFF121111),
    );
  }
}

Widget addNewPlaylist(double screenWidth) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: screenWidth * 0.03),
    child: Row(
      children: [
        Container(
          height: screenWidth * 0.18,
          width: screenWidth * 0.18,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.cyan,
          ),
          child: Icon(
            Icons.add,
            color: Colors.black,
            size: screenWidth * 0.09,
          ),
        ),
        SizedBox(width: screenWidth * 0.05),
        Text(
          'Add New Playlist',
          style: TextStyle(
            fontSize: screenWidth * 0.05,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}

Widget folderItem(String title, String subtitle, String imagePath, double screenWidth, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PlaylistScreen(),
        ),
      );
    },
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.03),
      child: Row(
        children: [
          Container(
            height: screenWidth * 0.2,
            width: screenWidth * 0.2,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(screenWidth * 0.03),
            ),
          ),
          SizedBox(width: screenWidth * 0.05),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: screenWidth * 0.015),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  color: Colors.white54,
                ),
              ),
            ],
          ),
          Spacer(),
          Icon(
            Icons.more_vert,
            color: Colors.white54,
            size: screenWidth * 0.06,
          ),
        ],
      ),
    ),
  );
}
