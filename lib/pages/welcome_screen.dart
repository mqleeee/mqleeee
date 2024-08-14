import 'package:flutter/material.dart';
import 'package:project_musium/pages/Sign_in.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color insideCircle = Color(0xFF121111);
    Color mycolor = Color(0xFF06A0B5);
    Color backgroundColorr = Color(0xFF39C0D4);

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
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 3,
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
                          margin: EdgeInsets.only(top: 16.0),
                          height: 120,
                          width: 250,
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
                            Icon(Icons.remove, color: mycolor, size: 40.0),
                            Icon(Icons.remove, color: Colors.white, size: 40.0),
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
                                  offset: Offset(0,0)
                                ),
                              ],
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child:ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => SignIn())
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
                                padding: EdgeInsets.symmetric(horizontal: 110),
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
                top: 105,
                right: 50,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: insideCircle.withOpacity(0.1),
                        spreadRadius: 8,
                        blurRadius: 19,
                        offset: Offset(4,-8),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: mycolor
                  ),
                ),
              ),
              // Positioned(
              //   top: 75,
              //   left: 30,
              //   child: Stack(
              //     children: <Widget>[
              //       Container(
              //         width: 120,
              //         height: 120,
              //         decoration: BoxDecoration(
              //           shape: BoxShape.circle,
              //           boxShadow: [
              //             BoxShadow(
              //               color: insideCircle.withOpacity(0.5),
              //               spreadRadius: -50,
              //               blurRadius: 19,
              //               offset: Offset(4,-8),
              //             )
              //           ],
              //         ),
              //       ),
              //       CircleAvatar(
              //         radius: 60,
              //         backgroundColor: mycolor,
              //       )
              //     ],
              //   ),
              // ),
              Positioned(
                top: 75,
                left: 30,
                child: Stack(
                  children: [
                    // Vòng tròn lớn hơn với bóng mờ
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: mycolor,

                      ),
                    ),
                    // Vòng tròn nhỏ hơn để tạo hiệu ứng trăng khuyết
                    Positioned(
                      left: 18, // Điều chỉnh vị trí để tạo hiệu ứng trăng khuyết
                      top: 6,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: mycolor,
                          boxShadow: [
                            BoxShadow(
                              color: insideCircle.withOpacity(0.1),
                              spreadRadius: -8,
                              blurRadius: 10,
                              offset: Offset(4, 4),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 250,
                right: 30,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: mycolor.withOpacity(1),
                        spreadRadius: 0,
                        blurRadius: 60,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.black12,
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
