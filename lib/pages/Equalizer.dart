import 'package:flutter/material.dart';
import 'package:project_musium/pages/Queue.dart';

class Equalizer extends StatefulWidget {
  const Equalizer({super.key});

  @override
  State<Equalizer> createState() => _EqualizerState();
}

class _EqualizerState extends State<Equalizer> {
  int _selectedPresetIndex = -1; // Index of the selected preset button

  // List of slider values
  List<double> _sliderValues = [0.65, 0.48, 0.8, 0.55, 0.6, 0.3, 0.85];

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    return Scaffold(
      backgroundColor: Color(0xFF121111),
      appBar: AppBar(
        backgroundColor: Color(0xFF121111),
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => QueueScreen()));
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          'Equalizer',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: screenWidth * 0.06, // Responsive font size
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                child: Container(
                  height: screenHeight * 0.07, // Responsive height
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.13),
                    borderRadius: BorderRadius.circular(screenWidth * 0.03), // Responsive border radius
                    border: Border.all(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF00C2CB).withOpacity(0.2),
                              blurRadius: 4,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Icon(Icons.phone_iphone, color: Color(0xFF00C2CB), size: screenWidth * 0.05), // Responsive icon size
                      ),
                      Text(
                        'BUILT-IN SPEAKERS',
                        style: TextStyle(
                          color: Color(0xFF00C2CB),
                          fontSize: screenWidth * 0.04, // Responsive font size
                          fontWeight: FontWeight.w400,
                          shadows: [
                            Shadow(
                              color: Color(0xFF00C2CB).withOpacity(0.4),
                              blurRadius: 30,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF00C2CB).withOpacity(0.2),
                              blurRadius: 4,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Icon(Icons.keyboard_arrow_down, color: Color(0xFF00C2CB), size: screenWidth * 0.05), // Responsive icon size
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02), // Responsive spacing
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'PRESETS',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF8A9A9D),
                      fontSize: screenWidth * 0.04, // Responsive font size
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02), // Responsive spacing
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(5, (index) {
                    final buttonLabels = ['Custom', 'Normal', 'Pop', 'Classic', 'Heavy M'];
                    return Padding(
                      padding: index < 4
                          ? EdgeInsets.only(right: screenWidth * 0.02) // Responsive spacing
                          : EdgeInsets.zero,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: _selectedPresetIndex == index
                              ? LinearGradient(
                            colors: [Color(0xFF00C2CB), Color(0xFF326D75)],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          )
                              : null,
                          borderRadius: BorderRadius.circular(screenWidth * 0.03), // Responsive border radius
                          border: Border.all(
                            color: _selectedPresetIndex == index
                                ? Colors.transparent // Remove border on select
                                : Colors.white, // Border color when not selected
                            width: 1,
                          ),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _selectedPresetIndex = index;
                              });
                            },
                            borderRadius: BorderRadius.circular(30), // Responsive border radius
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01, horizontal: screenWidth * 0.04), // Responsive padding
                              child: Center(
                                child: Text(
                                  buttonLabels[index],
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.04, // Responsive font size
                                    fontWeight: FontWeight.w400,
                                    color: _selectedPresetIndex == index
                                        ? Colors.white // Text color when selected
                                        : Colors.white, // Text color when unselected
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: screenHeight * 0.03), // Responsive spacing
              Stack(
                children: [
                  Container(
                    height: screenHeight * 0.275, // Responsive height
                    color: Colors.transparent,
                    child: Center(
                      child: Container(
                        height: 2,
                        color: Color(0xFF00C2CB),
                        width: double.infinity,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: screenHeight * 0.13, // Responsive positioning
                    left: screenWidth * 0.02,
                    child: Text(
                      '0',
                      style: TextStyle(
                        color: Color(0xFF00C2CB),
                        fontSize: screenWidth * 0.03, // Responsive font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(7, (index) {
                      return Expanded(
                        child: Column(
                          children: [
                            Container(
                              height: screenHeight * 0.25, // Responsive height
                              child: RotatedBox(
                                quarterTurns: 3,
                                child: Slider(
                                  value: _sliderValues[index],
                                  min: 0,
                                  max: 1,
                                  onChanged: (value) {
                                    setState(() {
                                      _sliderValues[index] = value;
                                    });
                                  },
                                  activeColor: Color(0xFF00C2CB),
                                  inactiveColor: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              '3',
                              style: TextStyle(
                                color: Color(0xFF00C2CB),
                                fontSize: screenWidth * 0.03, // Responsive font size
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '2',
                              style: TextStyle(
                                color: Color(0xFF00C2CB),
                                fontSize: screenWidth * 0.03, // Responsive font size
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03), // Responsive spacing
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // First CircleAvatar with text
                  Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          CircleAvatar(
                            radius: screenWidth * 0.12, // Responsive radius
                            backgroundColor: Color(0xFF00C2CB),
                            child: CircleAvatar(
                              radius: screenWidth * 0.05, // Responsive radius
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.01), // Responsive spacing
                      Text(
                        'Bass Boost : 23%',
                        style: TextStyle(
                          color: Color(0xFF00C2CB),
                          fontSize: screenWidth * 0.04, // Responsive font size
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  // Second CircleAvatar with text
                  Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          CircleAvatar(
                            radius: screenWidth * 0.12, // Responsive radius
                            backgroundColor: Color(0xFF00C2CB),
                            child: CircleAvatar(
                              radius: screenWidth * 0.05, // Responsive radius
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.01), // Responsive spacing
                      Text(
                        '3D Effect : 69%',
                        style: TextStyle(
                          color: Color(0xFF00C2CB),
                          fontSize: screenWidth * 0.04, // Responsive font size
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
