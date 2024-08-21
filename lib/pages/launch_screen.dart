import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_musium/pages/welcome_screen.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color insideCircle = Color(0xFF121111);

    // Get screen size
    final screenSize = MediaQuery.of(context).size;

    // Dynamic dimensions based on screen size
    final double logoHeight = screenSize.height * 0.4; // 50% of screen height
    final double lunaSize = screenSize.height * 0.4; // 40% of screen width

    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
      );
    });

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: insideCircle,
        statusBarIconBrightness: Brightness.light));

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Stack(
              children: <Widget>[
                Center(
                  child: Image(
                    image: AssetImage('assets/images/luna.png'),
                    height: lunaSize,
                    width: lunaSize,
                    fit: BoxFit.contain,
                ),
                ),
                Positioned(
                  bottom: screenSize.height * 0.4, // 10% from the bottom
                  left: screenSize.width * 0.3, // Center horizontally
                  right: screenSize.width * 0.3,
                    child: Image(
                      image: AssetImage('assets/images/logo1.png'),
                      height: logoHeight,
                      width: logoHeight, // Keeping logo aspect ratio as a square
                      fit: BoxFit.cover,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
