import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_musium/pages/Log_in.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});
  @override
  Widget build(BuildContext context) {
    Color insideCircle = Color(0xFF121111);
    Color button = Color(0xFF1E1E1E);
    Color borderbutton = Color(0xFFDBE7E8);
    Color mycolor = Color(0xFF06A0B5);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: insideCircle,
        statusBarIconBrightness: Brightness.light));
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(0.0),
          child: Container(
            color: insideCircle,
            child: Column(
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 10, // Khoảng cách từ trái
                        top: 20, // Khoảng cách từ trên cùng
                        child: IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.white,size: 30,),
                          onPressed: () {
                            Navigator.pop(context); // Quay lại trang trước
                          },
                        ),
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(top: 0),
                  height: 200,
                  width: 320,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/logo.png'),
                          fit: BoxFit.cover)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text("Let's get you in",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 44,
                          letterSpacing: 2.5),
                      textAlign: TextAlign.center),
                ),
                google(button, borderbutton),
                facebook(button, borderbutton),
                apple(button, borderbutton),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'or',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: mycolor.withOpacity(0.3),
                          spreadRadius: 4,
                          blurRadius: 10,
                          offset: Offset(0, 0),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LogIn())
                        );
                      },
                      child: Text(
                        'Log in with a password',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: mycolor,
                        minimumSize: Size(double.infinity, 50),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.w500,
                          )),
                      TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                              color: mycolor,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              letterSpacing: 1.5,
                              shadows: [
                                Shadow(
                                    color: mycolor.withOpacity(0.6),
                                    offset: Offset(0, 0),
                                    blurRadius: 30)
                              ]))
                    ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding facebook(Color button, Color borderbutton) {
    return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/images/facebook.png',
                            width: 24, height: 24),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Continue With Facebook',
                          style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 1,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: button,
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                                color: borderbutton, width: 0.2)))),
              );
  }

  Padding apple(Color button, Color borderbutton) {
    return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.apple,
                          size: 24,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Continue With Apple',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: button,
                        minimumSize: Size(double.infinity, 50),
                        padding: EdgeInsets.symmetric(horizontal: 80),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                                color: borderbutton, width: 0.2)))),
              );
  }

  Padding google(Color button, Color borderbutton) {
    return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/images/google.png',
                            width: 24, height: 24),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Continue With Google',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: button,
                        minimumSize: Size(double.infinity, 50),
                        padding: EdgeInsets.symmetric(horizontal: 80),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                                color: borderbutton, width: 0.2)))),
              );
  }
}
