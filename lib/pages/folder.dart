import 'package:flutter/material.dart';
import 'package:project_musium/pages/MainScreen.dart'; // Import MainScreen

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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
          color: Colors.white,
        ),
        title: Text(
          'Moods',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w700
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sort By',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white54,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Recently played',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.cyan,
                          ),
                        ),
                        Icon(
                          Icons.import_export,
                          color: Colors.white54,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 40), // Adjusted height
                Expanded(
                  child: ListView(
                    children: [
                      addNewPlaylist(),
                      folderItem('current favorites', '20 songs',
                          'assets/images/based2.png'),
                      folderItem('3:00am vibes', '18 songs',
                          'assets/images/library2.png'),
                      folderItem('Lofi Loft', '63 songs',
                          'assets/images/folderc1.png'),
                      folderItem('rain on my window', '32 songs',
                          'assets/images/folderc4.png'),
                      folderItem('Anime OSTs', '20 songs',
                          'assets/images/hinh3.png'),
                    ],
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
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
      backgroundColor: Color(0xFF121111),
    );
  }
}
Widget addNewPlaylist() {
  return Padding(
    padding: const EdgeInsets.symmetric(
        vertical: 12.0), // Adjusted vertical padding
    child: Row(
      children: [
        Container(
          height: 70, // Increased size
          width: 70, // Increased size
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.cyan,
          ),
          child: Icon(
            Icons.add,
            color: Colors.black,
            size: 36, // Increased icon size
          ),
        ),
        SizedBox(width: 20), // Increased width
        Text(
          'Add New Playlist',
          style: TextStyle(
            fontSize: 20, // Increased font size
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}

Widget folderItem(String title, String subtitle, String imagePath) {
  return Padding(
    padding: const EdgeInsets.symmetric(
        vertical: 12.0), // Adjusted vertical padding
    child: Row(
      children: [
        Container(
          height: 80, // Increased size
          width: 80, // Increased size
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
            borderRadius:
            BorderRadius.circular(12), // Increased border radius
          ),
        ),
        SizedBox(width: 20), // Increased width
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20, // Increased font size
                color: Colors.white,
              ),
            ),
            SizedBox(height: 6), // Increased space
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 16, // Increased font size
                color: Colors.white54,
              ),
            ),
          ],
        ),
        Spacer(),
        Icon(
          Icons.more_vert,
          color: Colors.white54,
        ),
      ],
    ),
  );
}
