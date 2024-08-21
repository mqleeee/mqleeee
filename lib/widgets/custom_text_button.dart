import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;
  final Color selectedColor;
  final Color unselectedColor;
  final Color borderColor;
  final Widget destinationPage; // Trang đến khi nhấn nút
  final Widget libraryPage; // Thêm tham số trang Library


  const CustomTextButton({
    Key? key,
    required this.label,
    required this.isSelected,
    required this.onPressed,
    this.selectedColor = const Color(0xFF15686B),
    this.unselectedColor = const Color(0xFF121111),
    this.borderColor = Colors.white,
    required this.destinationPage,
    required this.libraryPage, // Thêm tham số trang Library
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: isSelected
            ? LinearGradient(
          colors: [selectedColor, Color(0xFF06A0B5).withOpacity(0.9)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )
            : null,
        color: isSelected ? null : unselectedColor,
        border: Border.all(color: borderColor, width: 1),
      ),
      child: TextButton(
        onPressed: () {
          onPressed();
          if (isSelected) {
            // Nếu nút hiện tại đã được chọn, quay về trang Library
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => libraryPage),
            );
          } else {
            onPressed();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => destinationPage),
            );
          }
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.transparent,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 13,
            color: Colors.white,
            letterSpacing: 0.6,
          ),
        ),
      ),
    );
  }
}
