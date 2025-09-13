import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/core/assets/app_icons.dart';
import 'package:project/core/theme/app_colors.dart';
import 'package:project/features/category/presentation/pages/category_page.dart';
import 'package:project/features/checkout/presentation/pages/cart_page.dart';
import 'package:project/features/home/presentation/pages/home_page.dart';
import 'package:project/features/profile/presentation/pages/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _HomePageState();
}

class _HomePageState extends State<MainPage> {
  final List<Widget> _pages = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    ProfilePage(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: _pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        backgroundColor: Colors.grey.shade50,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Color(AppColors.primaryColor),
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Colors.grey.shade500,
        ),

        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.homeFill,
              color: currentIndex == 0
                  ? Color(AppColors.primaryColor)
                  : Colors.grey.shade500,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.menuFill,
              color: currentIndex == 1
                  ? Color(AppColors.primaryColor)
                  : Colors.grey.shade500,
            ),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.cartFill,
              color: currentIndex == 2
                  ? Color(AppColors.primaryColor)
                  : Colors.grey.shade500,
            ),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.profileFill,
              color: currentIndex == 3
                  ? Color(AppColors.primaryColor)
                  : Colors.grey.shade500,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
