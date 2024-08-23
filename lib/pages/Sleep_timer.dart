import 'package:flutter/material.dart';
import 'package:project_musium/pages/Menu.dart';

class SleepTimerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF000000),
              Color(0xFF1A1A1A),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.55), // Khoảng cách trên dựa trên tỷ lệ chiều cao màn hình
            Center(
              child: Text(
                'Stop audio in',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.05, // Kích thước chữ dựa trên tỷ lệ chiều rộng màn hình
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.55,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.07), // Khoảng cách dưới tiêu đề dựa trên tỷ lệ chiều cao màn hình
            Expanded(
              child: Container(
                color: Colors.transparent, // Màu nền phụ cho các tùy chọn
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1), // Padding theo tỷ lệ chiều rộng màn hình
                child: ListView(
                  children: [
                    sleepTimerOption('End of Track', context),
                    sleepTimerOption('60 seconds', context),
                    sleepTimerOption('5 minutes', context),
                    sleepTimerOption('10 minutes', context),
                    sleepTimerOption('15 minutes', context),
                    sleepTimerOption('30 minutes', context),
                    sleepTimerOption('1 hour', context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sleepTimerOption(String title, BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MenuScreen()),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.02), // Khoảng cách dọc dựa trên tỷ lệ chiều cao màn hình
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: screenWidth * 0.04, // Kích thước chữ dựa trên tỷ lệ chiều rộng màn hình
            fontWeight: FontWeight.w700,
            letterSpacing: 0.55,
          ),
        ),
      ),
    );
  }
}
