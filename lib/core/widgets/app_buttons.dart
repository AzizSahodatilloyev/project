import 'package:flutter/material.dart';
import 'package:project/core/theme/app_colors.dart';

class SplashButton extends StatelessWidget {
  final Color color;
  final Color titleColor;
  final String title;
  final VoidCallback onPressed;

  const SplashButton({
    super.key,
    this.color = const Color(AppColors.primaryColor),
    this.title = 'Get Started',
    this.titleColor = Colors.white,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        backgroundColor: color,
        elevation: 0,
        maximumSize: Size(500, 500),
        minimumSize: Size(10, 10),
        fixedSize: Size(double.infinity, 56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),

      child: Text(
        title,
        style: TextStyle(
          color: titleColor,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class AuthButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const AuthButton({
    super.key,
    this.title = 'Get Started',
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        backgroundColor: Color(AppColors.primaryColor),
        elevation: 0,
        maximumSize: Size(500, 500),
        minimumSize: Size(10, 10),
        fixedSize: Size(double.infinity, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(48)),
        ),
      ),

      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class HomeButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const HomeButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(0),
        backgroundColor: Color(AppColors.primaryColor),
        elevation: 0,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
      ),

      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
