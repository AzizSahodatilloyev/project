import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/core/assets/app_icons.dart';
import 'package:project/core/assets/app_images.dart';
import 'package:project/core/theme/app_colors.dart';

class VendorsPage extends StatelessWidget {
  const VendorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vendors = [
      {"name": "Wattpad", "image": AppImages.vendor1},
      {"name": "Kuromi", "image": AppImages.vendor2},
      {"name": "Crane & Co", "image": AppImages.vendor3},
      {"name": "GooDay", "image": AppImages.vendor4},
      {"name": "Warehouse", "image": AppImages.vendor5},
      {"name": "Peppa Pig", "image": AppImages.vendor6},
      {"name": "Jstor", "image": AppImages.vendor7},
      {"name": "Peloton", "image": AppImages.vendor8},
      {"name": "Haymarket", "image": AppImages.vendor9},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: SvgPicture.asset(AppIcons.arrowLeftOutline),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Vendors",
          style: TextStyle(
            color: Colors.grey.shade900,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(icon: SvgPicture.asset(AppIcons.search), onPressed: () {}),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              width: 359,
              height: 90,
              padding: EdgeInsets.only(top: 16, left: 8, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Our Vendors",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "Vendors",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Color(AppColors.primaryColor),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 10),

          // Tabs Row
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Container(
              height: 56,
              alignment: Alignment.center,
              child: ListView(
                scrollDirection: Axis.horizontal,

                children: [
                  _tabItem("All", true),
                  SizedBox(width: 18),
                  _tabItem("Books", false),
                  SizedBox(width: 18),
                  _tabItem("Poems", false),
                  SizedBox(width: 18),
                  _tabItem("Special for you", false),
                  SizedBox(width: 18),
                  _tabItem("Stationary", false),
                ],
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Vendors Grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GridView.builder(
                itemCount: vendors.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: 153,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final vendor = vendors[index];
                  return Container(
                    width: 101,
                    height: 153,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Image.asset(
                            vendor["image"]!,
                            width: 110,
                            height: 101,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          vendor["name"]!,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade900,
                          ),
                        ),
                        SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star, size: 18, color: Colors.yellow),
                            Icon(Icons.star, size: 18, color: Colors.yellow),
                            Icon(Icons.star, size: 18, color: Colors.yellow),
                            Icon(Icons.star, size: 18, color: Colors.yellow),
                            Icon(
                              Icons.star,
                              size: 18,
                              color: Colors.grey.shade900,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _tabItem(String text, bool isActive) {
  return Padding(
    padding: const EdgeInsets.only(right: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: isActive ? 18 : 16,
            fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
            color: isActive ? Colors.grey.shade900 : Colors.grey.shade500,
          ),
        ),
        if (isActive)
          Container(
            margin: const EdgeInsets.only(top: 4),
            height: 2,
            width: 24,
            color: Color(AppColors.primaryColor),
          ),
      ],
    ),
  );
}
