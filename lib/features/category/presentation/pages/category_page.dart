import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/core/assets/app_icons.dart';
import 'package:project/core/assets/app_images.dart';
import 'package:project/core/theme/app_colors.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final products = [
    {
      "title": "The Da Vinci Code",
      "price": "\$19.99",
      "image": AppImages.product1,
    },
    {"title": "Carrie Fisher", "price": "\$27.12", "image": AppImages.product2},
    {
      "title": "The Good Sister",
      "price": "\$27.12",
      "image": AppImages.product3,
    },
    {"title": "The Waiting", "price": "\$27.12", "image": AppImages.product4},
    {"title": "Where Are You", "price": "\$31.99", "image": AppImages.product5},
    {
      "title": "Bright Young Woman",
      "price": "\$24.49",
      "image": AppImages.product6,
    },
    {
      "title": "The Da Vinci Code",
      "price": "\$19.99",
      "image": AppImages.product1,
    },
    {"title": "Carrie Fisher", "price": "\$27.12", "image": AppImages.product2},
    {
      "title": "The Good Sister",
      "price": "\$27.12",
      "image": AppImages.product3,
    },
    {"title": "The Waiting", "price": "\$27.12", "image": AppImages.product4},
    {"title": "Where Are You", "price": "\$31.99", "image": AppImages.product5},
    {
      "title": "Bright Young Woman",
      "price": "\$24.49",
      "image": AppImages.product6,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: SvgPicture.asset(AppIcons.search),
          onPressed: () {},
        ),
        title: Text(
          "Category",
          style: TextStyle(
            color: Colors.grey.shade900,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(AppIcons.bellOutline),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
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
                  _tabItem("Novels", false),
                  SizedBox(width: 18),
                  _tabItem("Self Love", false),
                  SizedBox(width: 18),
                  _tabItem("Science", false),
                  SizedBox(width: 18),
                  _tabItem("Romantic", false),
                ],
              ),
            ),
          ),
          SizedBox(height: 24),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                mainAxisSpacing: 20,
                crossAxisSpacing: 11,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          product["image"]!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      product["title"]!,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.grey.shade900,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      product["price"]!,
                      style: const TextStyle(
                        color: Color(AppColors.primaryColor),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                );
              },
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
