import 'package:flutter/material.dart';

class LoginButon extends StatelessWidget {
  final Image image;
  final String title;
  final VoidCallback onPressed;

  const LoginButon({
    super.key,
    required this.title,
    required this.onPressed,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        backgroundColor: Colors.white,
        elevation: 0,
        maximumSize: Size(500, 500),
        minimumSize: Size(10, 10),
        fixedSize: Size(double.infinity, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          side: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
      ),

      child: Row(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: image.image, width: 16, height: 16),
          Text(
            title,
            style: TextStyle(
              color: Colors.grey.shade900,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
