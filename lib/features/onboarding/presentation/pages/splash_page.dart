import 'package:flutter/material.dart';
import 'package:project/core/assets/app_images.dart';
import 'package:project/core/theme/app_colors.dart';
import 'package:project/features/onboarding/presentation/pages/start_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _nextPage();
  }

  void _nextPage() async {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => StartPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(AppColors.primaryColor),
      body: Center(
        child: Row(
          spacing: 3,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(AppImages.appLogo)),
            Text(
              "Bazar.",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
