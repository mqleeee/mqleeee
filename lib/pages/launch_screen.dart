import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_musium/pages/welcome_screen.dart';
class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color insideCircle = Color(0xFF121111);
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
        child:Container(
          color: Colors.black,
          child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Stack(
                children: <Widget>[
                  Image(image: AssetImage('assets/images/logo.png'),height: double.infinity,width: double.infinity,),
                  Positioned(
                    bottom: 20.0,
                    right: 5.0,
                    left: 5.0,
                    child: Image(
                      image: AssetImage('assets/images/luna.png'),height: 200,width:200,alignment: Alignment.bottomCenter,fit: BoxFit.cover,
                    ),
                  )
                ],
              )
          ),
        )
      ),
    );
  }
}
