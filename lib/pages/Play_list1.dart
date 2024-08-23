import 'package:flutter/material.dart';
import 'package:project_musium/pages/Folder.dart';
import 'package:project_musium/pages/MainScreen.dart';
import 'package:project_musium/pages/Song.dart';

class PlaylistScreen extends StatefulWidget {
  const PlaylistScreen({super.key});

  @override
  _PlaylistScreenState createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
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
      backgroundColor: Color(0xFF121111),
      appBar: AppBar(
        backgroundColor: Color(0xFF121111),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Folder())); // Return to previous screen
          },
          color: Colors.white,
        ),
        title: Text(
          'FROM "PLAYLISTS"',
          style: TextStyle(
            fontSize: screenWidth * 0.035, // Responsive font size
            color: Color(0xFFFFFFFF),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // More actions
            },
            color: Colors.white,
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: screenHeight * 0.25, // Responsive height
                  width: screenHeight * 0.25, // Responsive width
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/folderc1.png'), // Your image asset
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(screenWidth * 0.02), // Responsive border radius
                  ),
                ),
                SizedBox(height: screenHeight * 0.02), // Responsive spacing
                Text(
                  'Lofi Loft',
                  style: TextStyle(
                    fontSize: screenWidth * 0.07, // Responsive font size
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.01), // Responsive spacing
                Text(
                  'soft, chill, dreamy, lo-fi beats',
                  style: TextStyle(
                    fontSize: screenWidth * 0.035, // Responsive font size
                    color: Colors.white54,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.03), // Responsive spacing
                Expanded(
                  child: ListView(
                    children: [
                      playlistItem(context, 'grainy days', 'moody.', 'assets/images/playlistsc1.png'),
                      playlistItem(context, 'Coffee', 'Kainbeats', 'assets/images/playlistsc2.png'),
                      playlistItem(context, 'raindrops', 'rainyxxx', 'assets/images/playlistsc3.png'),
                      playlistItem(context, 'Tokyo', 'SmYang', 'assets/images/playlistsc4.png'),
                      playlistItem(context, 'Lullaby', 'iamfinenow', 'assets/images/playlistsc5.png'),
                      playlistItem(context, 'Hazel Eyes', 'moody.', 'assets/images/playlistsc6.png'),
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
              color: Colors.black.withOpacity(0.7), // Shadow color
              spreadRadius: 10, // Shadow spread radius
              blurRadius: 20, // Shadow blur radius
              offset: Offset(0, -3), // Shadow offset
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(1), // Solid black at the bottom
              Colors.black.withOpacity(0.0), // Transparent at the top
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
          backgroundColor: Colors.transparent, // Transparent background
          elevation: 0,
        ),
      ),
    );
  }

  Widget playlistItem(BuildContext context, String title, String artist, String imagePath) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01), // Responsive vertical padding
      child: Row(
        children: [
          Container(
            height: screenHeight * 0.08, // Responsive height
            width: screenHeight * 0.08, // Responsive width
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(screenWidth * 0.02), // Responsive border radius
            ),
          ),
          SizedBox(width: screenWidth * 0.04), // Responsive horizontal spacing
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: screenWidth * 0.045, // Responsive font size
                  color: Colors.white,
                ),
              ),
              SizedBox(height: screenHeight * 0.005), // Responsive spacing
              Text(
                artist,
                style: TextStyle(
                  fontSize: screenWidth * 0.035, // Responsive font size
                  color: Colors.white54,
                ),
              ),
            ],
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SongScreen()));
            },
          )
        ],
      ),
    );
  }
}
