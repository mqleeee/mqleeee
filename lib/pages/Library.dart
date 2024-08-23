import 'package:flutter/material.dart';
import 'package:project_musium/pages/Artists.dart';
import 'package:project_musium/pages/Folders.dart';
import 'package:project_musium/pages/Playlists.dart';
import 'package:project_musium/pages/Albums.dart';
import 'package:project_musium/pages/Podcast_shows.dart';
import 'package:project_musium/pages/Search.dart';
import 'package:project_musium/widgets/custom_text_button.dart'; // Import widget mới

class Library extends StatefulWidget {
  const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  int selectedIndex = -1;
  final List<Widget> pages = [
    Folders(),
    Playlists(),
    Artists(),
    Albums(),
    Podcasts_Shows()
  ];

  void _onTextButtonPressed(int index) {
    setState(() {
      if (selectedIndex == index) {
        selectedIndex = -1;
      } else {
        selectedIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double buttonSpacing = screenWidth * 0.05;
    final double avatarRadius = screenWidth * 0.07;
    final double iconSize = screenWidth * 0.08;
    final double textFontSize = screenHeight * 0.025;

    return Scaffold(
      backgroundColor: const Color(0xFF121111),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: const AssetImage('assets/images/logo1.png'),
                    width: screenWidth * 0.15,
                    height: screenWidth * 0.15,
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  Text(
                    'Your Library',
                    style: TextStyle(
                      color: const Color(0xFF06A0B5),
                      fontSize: screenHeight * 0.035,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: Icon(Icons.search, size: iconSize, color: Colors.white),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Search()));
                    },
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
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
                      libraryPage: Library(),
                    ),
                    SizedBox(width: buttonSpacing),
                    CustomTextButton(
                      label: 'Playlists',
                      isSelected: selectedIndex == 1,
                      onPressed: () => _onTextButtonPressed(1),
                      destinationPage: Playlists(),
                      libraryPage: Library(),
                    ),
                    SizedBox(width: buttonSpacing),
                    CustomTextButton(
                      label: 'Artists',
                      isSelected: selectedIndex == 2,
                      onPressed: () => _onTextButtonPressed(2),
                      destinationPage: Artists(),
                      libraryPage: Library(),
                    ),
                    SizedBox(width: buttonSpacing),
                    CustomTextButton(
                      label: 'Albums',
                      isSelected: selectedIndex == 3,
                      onPressed: () => _onTextButtonPressed(3),
                      destinationPage: Albums(),
                      libraryPage: Library(),
                    ),
                    SizedBox(width: buttonSpacing),
                    CustomTextButton(
                      label: 'Podcasts & Shows',
                      isSelected: selectedIndex == 4,
                      onPressed: () => _onTextButtonPressed(4),
                      destinationPage: Podcasts_Shows(),
                      libraryPage: Library(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Expanded(
                child: selectedIndex == -1
                    ? SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: const Color(0xFF39C0D4),
                            radius: avatarRadius,
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.add, color: Colors.black),
                              iconSize: iconSize,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.03),
                          Text(
                            'Add New Playlist',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: textFontSize,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: const Color(0xFF39C0D4),
                            radius: avatarRadius,
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.favorite_border,
                                  color: Colors.black),
                              iconSize: iconSize,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.03),
                          Text(
                            'Your Like Songs',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: textFontSize,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.arrow_downward_outlined,
                            color: Colors.blueGrey,
                            size: iconSize,
                          ),
                          Icon(
                            Icons.arrow_upward_outlined,
                            color: Colors.blueGrey,
                            size: iconSize,
                          ),
                          SizedBox(width: screenWidth * 0.01),
                          Text(
                            'Recently played',
                            style: TextStyle(
                                color: const Color(0xFF39C0D4),
                                fontWeight: FontWeight.w700,
                                fontSize: textFontSize),
                          )
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: const AssetImage(
                                'assets/images/library1.png'),
                            radius: avatarRadius * 1.2,
                          ),
                          SizedBox(width: screenWidth * 0.03),
                          Text(
                            'Conan Gray',
                            style: TextStyle(
                              fontSize: textFontSize,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      Row(
                        children: <Widget>[
                          Container(
                            width: avatarRadius * 2.4,
                            height: avatarRadius * 2.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: const DecorationImage(
                                image: AssetImage(
                                    'assets/images/library2.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.03),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '3:00am vibes',
                                style: TextStyle(
                                  fontSize: textFontSize,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '18 songs',
                                style: TextStyle(
                                  fontSize: textFontSize * 0.8,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      Row(
                        children: <Widget>[
                          Container(
                            width: avatarRadius * 2.4,
                            height: avatarRadius * 2.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: const DecorationImage(
                                image: AssetImage(
                                    'assets/images/library3.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.03),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Wiped Out!',
                                style: TextStyle(
                                  fontSize: textFontSize,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'The Neighbourhood',
                                style: TextStyle(
                                  fontSize: textFontSize * 0.8,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      Row(
                        children: <Widget>[
                          Container(
                            width: avatarRadius * 2.4,
                            height: avatarRadius * 2.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: const DecorationImage(
                                image: AssetImage(
                                    'assets/images/library4.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.03),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'AFTER HOURS',
                                style: TextStyle(
                                  fontSize: textFontSize,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'The Weeknd',
                                style: TextStyle(
                                  fontSize: textFontSize * 0.8,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )
                    : pages[selectedIndex],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
