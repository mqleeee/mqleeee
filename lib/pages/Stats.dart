import 'package:flutter/material.dart';

class Stats extends StatefulWidget {
  const Stats({super.key});

  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  int selectedIndex = 0;

  // List of track data
  final List<Map<String, String>> tracks = [
    {'rank': '#1', 'title': 'Swim', 'artist': 'Chase Atlantic', 'image': 'assets/images/stats1.png'},
    {'rank': '#2', 'title': 'Time', 'artist': 'NF', 'image': 'assets/images/stats3.png'},
    {'rank': '#3', 'title': 'Movies', 'artist': 'Conan Gray', 'image': 'assets/images/stats4.png'},
    {'rank': '#4', 'title': 'lowkey', 'artist': 'Niki', 'image': 'assets/images/stats5.png'},
    {'rank': '#5', 'title': 'Hurt', 'artist': 'NewJeans', 'image': 'assets/images/stats6.png'},
    {'rank': '#6', 'title': 'ILLUSION', 'artist': 'aespa', 'image': 'assets/images/stats7.png'},
    {'rank': '#7', 'title': 'Pink Venom', 'artist': 'BlackPink', 'image': 'assets/images/stats8.png'},
    {'rank': '#8', 'title': 'moods', 'artist': '11 playlists', 'image': 'assets/images/stats9.png'},
    // Add more tracks as needed
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      backgroundColor: Color(0xFF121111),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        title: Column(
          children: <Widget>[
            Text(
              'Top',
              style: TextStyle(
                fontSize: screenWidth * 0.05, // Adjusted for screen width
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'Past 30 Days',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: screenWidth * 0.025, // Adjusted for screen width
                color: Colors.grey,
              ),
            )
          ],
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.grid_view, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 4, // Number of tabs
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildTextButton(0, 'Tracks', screenWidth),
                SizedBox(width: screenWidth * 0.05), // Adjusted for screen width
                buildTextButton(1, 'Artists', screenWidth),
                SizedBox(width: screenWidth * 0.05), // Adjusted for screen width
                buildTextButton(2, 'Albums', screenWidth),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  buildTracksList(screenWidth), // Content for the 'Tracks' tab
                  Center(
                    child: Text(
                      '6 months',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.04, // Adjusted for screen width
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      '1 Year',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.04, // Adjusted for screen width
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'LifeTime',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.04, // Adjusted for screen width
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Color(0xFF121111),
              child: TabBar(
                labelColor: Color(0xFF39C0D4),
                unselectedLabelColor: Colors.white,
                indicatorColor: Colors.transparent,
                tabs: [
                  Tab(text: '30 days'),
                  Tab(text: '6 months'),
                  Tab(text: '1 Year'),
                  Tab(text: 'LifeTime'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextButton(int index, String label, double screenWidth) {
    bool isSelected = selectedIndex == index;
    return Column(
      children: [
        TextButton(
          onPressed: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Color(0xFF39C0D4) : Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: screenWidth * 0.04, // Adjusted for screen width
              shadows: [
                if (isSelected)
                  Shadow(
                    color: Color(0xFF39C0D4), // Shadow color
                    offset: Offset(0, 0), // Shadow offset
                    blurRadius: 9, // Shadow blur radius
                  ),
              ],
            ),
          ),
        ),
        Container(
          height: screenWidth * 0.005, // Adjusted for screen width
          width: screenWidth * 0.25, // Adjusted for screen width
          decoration: BoxDecoration(
            color: isSelected ? Color(0xFF39C0D4) : Colors.transparent,
            boxShadow: isSelected
                ? [
              BoxShadow(
                color: Color(0xFF39C0D4), // Shadow color
                offset: Offset(0, 0), // Shadow offset
                blurRadius: 9, // Shadow blur radius
              ),
            ]
                : [],
          ),
        ),
      ],
    );
  }

  Widget buildTracksList(double screenWidth) {
    return ListView.builder(
      itemCount: tracks.length,
      itemBuilder: (context, index) {
        final track = tracks[index];
        return Container(
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.01, // Adjusted for screen height
            horizontal: screenWidth * 0.05, // Adjusted for screen width
          ),
          padding: EdgeInsets.all(screenWidth * 0.04), // Adjusted for screen width
          decoration: BoxDecoration(
            color: Color(0xFF1E1E1E),
            borderRadius: BorderRadius.circular(screenWidth * 0.02), // Adjusted for screen width
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02), // Adjusted for screen width
                child: Text(
                  track['rank']!,
                  style: TextStyle(
                    fontSize: screenWidth * 0.05, // Adjusted for screen width
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(width: screenWidth * 0.05), // Adjusted for screen width
              Container(
                height: screenWidth * 0.15, // Adjusted for screen width
                width: screenWidth * 0.15, // Adjusted for screen width
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(track['image']!),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(screenWidth * 0.02), // Adjusted for screen width
                ),
              ),
              SizedBox(width: screenWidth * 0.1), // Adjusted for screen width
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    track['title']!,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: screenWidth * 0.04, // Adjusted for screen width
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    track['artist']!,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: screenWidth * 0.03, // Adjusted for screen width
                      color: Colors.grey,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
