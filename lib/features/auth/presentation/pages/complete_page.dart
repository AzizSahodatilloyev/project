import 'package:flutter/material.dart';
import 'package:project/core/assets/app_images.dart';
import 'package:project/core/widgets/app_buttons.dart';
import 'package:project/features/auth/presentation/pages/login_page.dart';

class CompletePage extends StatefulWidget {
  const CompletePage({super.key});

  @override
  State<CompletePage> createState() => _CompletePageState();
}

class _CompletePageState extends State<CompletePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage(AppImages.congratulations)),
              SizedBox(height: 40),
              Column(
                spacing: 8,
                children: [
                  Text(
                    'Congratulation!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey.shade900,
                    ),
                  ),
                  Text(
                    'your account is complete, please enjoy the best menu from us.',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(height: 40),
              AuthButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                title: 'Get Started',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
