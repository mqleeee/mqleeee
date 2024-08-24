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
    final double buttonHeight = screenSize.width * 0.09;
    final double iconSize = screenSize.width * 0.1; // 10% of screen width for icons
    final double topPadding = screenSize.height * 0.02; // 2% chiều cao màn hình
    final double horizontalPadding = screenSize.width * 0.15; // 15% chiều rộng màn hình

    // Dynamic positioning and sizing for CircleAvatars
    final double avatarRadiusLarge = screenSize.width * 0.15;
    final double avatarRadiusMedium = screenSize.width * 0.08;
    final double avatarRadiusSmall = screenSize.width * 0.11;

    final double avatarHeightLarge = screenSize.height * 0.12;
    final double avatarHeightMedium = screenSize.height * 0.06;
    final double avatarHeightSmall = screenSize.height * 0.07;

    final double avatarTopLarge = screenSize.height * 0.06;
    final double avatarLeftLarge = screenSize.width * 0.13;
    final double avatarTopMedium = screenSize.height * 0.1;
    final double avatarRightMedium = screenSize.width * 0.15;
    final double avatarTopSmall = screenSize.height * 0.3;
    final double avatarRightSmall = screenSize.width * 0.1;

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
                                minimumSize: Size(buttonWidth, buttonHeight),
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
              Positioned(
                top: avatarTopLarge,
                left: avatarLeftLarge,
                child: ClipOval(
                  child: CircleAvatar(
                    radius: avatarRadiusLarge,
                    backgroundColor: Colors.cyan.shade300,
                    child: Container(
                      height: avatarHeightLarge,
                      width: avatarHeightLarge,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(4, -8),
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 19,
                            spreadRadius: 8,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: avatarTopMedium,
                right: avatarRightMedium,
                child: ClipOval(
                  child: CircleAvatar(
                    radius: avatarRadiusMedium,
                    backgroundColor: Colors.cyan.shade300,
                    child: Container(
                      height: avatarHeightMedium,
                      width: avatarHeightMedium,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(4, -8),
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 19,
                            spreadRadius: 8,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: avatarTopSmall,
                right: avatarRightSmall,
                child: ClipOval(
                  child: CircleAvatar(
                    radius: avatarRadiusSmall,
                    backgroundColor: Colors.cyan.shade300,
                    child: Container(
                      height: avatarHeightSmall,
                      width: avatarHeightSmall,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(4, -8),
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 19,
                            spreadRadius: 8,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(50),
                      ),
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
