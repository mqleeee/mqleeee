import 'package:flutter/material.dart';
import 'package:project_musium/pages/Equalizer.dart';
import 'package:project_musium/pages/Play_list1.dart';

class QueueScreen extends StatefulWidget {
  @override
  _QueueScreenState createState() => _QueueScreenState();
}

class _QueueScreenState extends State<QueueScreen> {
  List<bool> _selectedItems = List<bool>.filled(9, false);

  bool _isAnyItemSelected() {
    return _selectedItems.contains(true);
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFF121111),
      appBar: AppBar(
        automaticallyImplyLeading: false, // Disables the back button
        backgroundColor: Color(0xFF121111),
        elevation: 0,
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PLAYING FROM PLAYLIST:',
                  style: TextStyle(
                    fontSize: screenWidth * 0.03,
                    color: Colors.white70,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Lofi Loft',
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        color: Colors.cyan,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PlaylistScreen()),
                        );
                      },
                      child: Icon(Icons.arrow_drop_down_outlined,
                          color: Colors.white54),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'now playing :',
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/playlistsc1.png',
                        width: screenWidth * 0.12,
                        height: screenWidth * 0.12,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.04),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'grainy days',
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.005),
                        Text(
                          'moody.',
                          style: TextStyle(
                            fontSize: screenWidth * 0.03,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'next in queue :',
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedItems = List<bool>.filled(9, false);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.cyan, width: 2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            'CLEAR QUEUE',
                            style: TextStyle(
                              fontSize: screenWidth * 0.035,
                              color: Colors.cyan,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.01),
                Expanded(
                  child: ListView(
                    children: [
                      _buildQueueItem(0, 'Beguille', 'NIKI'),
                      _buildQueueItem(1, 'Stardust', 'Nyx'),
                      _buildQueueItem(2, 'Forever', 'moody.'),
                      SizedBox(height: screenHeight * 0.04),
                      Text(
                        'next in \'Lofi Loft\' :',
                        style: TextStyle(
                          fontSize: screenWidth * 0.045,
                          color: Colors.white,
                        ),
                      ),
                      _buildQueueItem(3, 'Coffee', 'Kainbeats'),
                      _buildQueueItem(4, 'raindrops', 'rainyyxx'),
                      _buildQueueItem(5, 'Tokyo', 'SmYang'),
                      _buildQueueItem(6, 'Lullaby', 'iamfinenow'),
                      _buildQueueItem(7, 'Hazel Eyes', 'moody.'),
                      _buildQueueItem(8, 'Sleepy', 'neononi'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (_isAnyItemSelected())
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: screenHeight * 0.15,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.9),
                      Colors.black.withOpacity(0.0),
                    ],
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: screenHeight * 0.015),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Equalizer()));
                      },
                      child: Text(
                        'REMOVE',
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          color: Colors.cyan,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Equalizer()));
                      },
                      child: Text(
                        'ADD TO QUEUE',
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          color: Colors.cyan,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildQueueItem(int index, String title, String artist) {
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItems[index] = !_selectedItems[index];
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
        child: Row(
          children: [
            Icon(
              _selectedItems[index]
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: _selectedItems[index] ? Colors.cyan : Colors.white70,
            ),
            SizedBox(width: screenWidth * 0.04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.01),
                  Text(
                    artist,
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.menu,
                color: Colors.white70), // Changed to three-bar icon
          ],
        ),
      ),
    );
  }
}
