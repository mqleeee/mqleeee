import 'package:flutter/material.dart';
import 'package:project_musium/pages/sign_in.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color mycolor = Color(0xFF06A0B5);
    Color backgroundColorr = Color(0xFF39C0D4);

    // Get screen size
    final screenSize = MediaQuery.of(context).size;

    // Dynamic dimensions based on screen size
    final double containerHeight = screenSize.height * 0.35; // 35% of screen height
    final double buttonWidth = screenSize.width * 0.7; // 70% of screen width
    final double buttonheight = screenSize.width * 0.09;
    final double iconSize = screenSize.width * 0.1; // 10% of screen width for icons
    final double topPadding = screenSize.height * 0.01; // 2% chiều cao màn hình
    final double horizontalPadding = screenSize.width * 0.17; // 15% chiều rộng màn hình

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(0.0),
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: backgroundColorr,
                  image: DecorationImage(
                    image: AssetImage('assets/images/girl1.png'),
                    fit: BoxFit.contain,
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: containerHeight,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            top: topPadding,
                            left: horizontalPadding,
                            right: horizontalPadding,
                          ),
                          child: Text(
                            'From the latest to the greatest hits, play your favorite tracks on musium now!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.remove, color: mycolor, size: iconSize),
                            Icon(Icons.remove, color: Colors.white, size: iconSize),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: mycolor.withOpacity(0.3),
                                  spreadRadius: 5,
                                  blurRadius: 10,
                                  offset: Offset(0, 0),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SignIn()),
                                );
                              },
                              child: Text(
                                'Get Started',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: mycolor,
                                minimumSize: Size(buttonWidth, buttonheight),
                                padding: EdgeInsets.symmetric(horizontal: 30),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
