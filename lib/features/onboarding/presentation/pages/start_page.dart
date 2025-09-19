import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/core/assets/app_images.dart';
import 'package:project/core/theme/app_colors.dart';
import 'package:project/core/widgets/app_buttons.dart';
import 'package:project/features/auth/cubit/auth_cubit.dart';
import 'package:project/features/auth/presentation/pages/login_page.dart';
import 'package:project/features/auth/presentation/pages/signup_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final List<_Page> _pages = [
    _Page(
      image: AppImages.onboarding1,
      title: 'Now reading books will be easier',
      content:
          ' Discover new worlds, join a vibrant reading community. Start your reading adventure effortlessly with us.',
    ),
    _Page(
      image: AppImages.onboarding2,
      title: 'Your Bookish Soulmate Awaits',
      content:
          'Let us be your guide to the perfect read. Discover books tailored to your tastes for a truly rewarding experience.',
    ),
    _Page(
      image: AppImages.onboarding3,
      title: 'Start Your Adventure',
      content:
          "Ready to embark on a quest for inspiration and knowledge? Your adventure begins now. Let's go!",
    ),
  ];
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: TextButton(
          onPressed: () {},
          child: Text(
            'Skip',
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 483,
            child: PageView.builder(
              controller: _controller,
              itemCount: _pages.length,
              itemBuilder: (context, index) {
                final page = _pages[index];
                return Column(
                  children: [
                    Image(image: AssetImage(page.image)),
                    SizedBox(height: 14),
                    SizedBox(
                      width: 370,
                      child: Text(
                        page.title,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: Color(0xFF121212),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 12),
                    SizedBox(
                      width: 370,
                      child: Text(
                        page.content,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xFFA6A6A6),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(height: 28),
          Align(
            alignment: Alignment.center,
            child: SmoothPageIndicator(
              controller: _controller,
              count: _pages.length,
              effect: ScaleEffect(
                activeDotColor: AppColors.primaryColor,
                radius: 24,
                dotWidth: 8,
                dotHeight: 8,
                spacing: 12,
                scale: 2.0,
              ),
            ),
          ),
          SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 8,
              children: [
                SplashButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                          value: context.read<AuthCubit>(),
                          child: const SignupPage(),
                        ),
                      ),
                    );
                  },
                ),
                SplashButton(
                  color: Color(0xFFFAF9FD),
                  title: 'Sign In',
                  titleColor: AppColors.primaryColor,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) => AuthCubit(),
                          child: LoginPage(),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Page {
  final String image;
  final String title;
  final String content;

  _Page({required this.image, required this.title, required this.content});
}
