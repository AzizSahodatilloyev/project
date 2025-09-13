import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/core/assets/app_icons.dart';
import 'package:project/core/assets/app_images.dart';
import 'package:project/core/theme/app_colors.dart';

class AuthorsPage extends StatelessWidget {
  final Map<String, String> author;

  const AuthorsPage({super.key, required this.author});

  @override
  Widget build(BuildContext context) {
    final products = [
      {
        "title": "The Da Vinci Code",
        "price": "\$19.99",
        "image": AppImages.product1,
      },
      {
        "title": "Carrie Fisher",
        "price": "\$27.12",
        "image": AppImages.product2,
      },
      {
        "title": "The Good Sister",
        "price": "\$27.12",
        "image": AppImages.product3,
      },
      {"title": "The Waiting", "price": "\$27.12", "image": AppImages.product4},
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
          "Authors",
          style: TextStyle(
            color: Colors.grey.shade900,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: ListView(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(author['image']!),
            ),

            SizedBox(height: 8),
            Text(
              "Novelist",
              style: TextStyle(
                color: Colors.grey.shade900,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              author["name"]!,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Colors.grey.shade900,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 23),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.grey.shade900),
                SizedBox(width: 6),
                Text(
                  "(4.0)",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.grey.shade900,
                  ),
                ),
              ],
            ),
            SizedBox(height: 22),
            Text(
              "About",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Colors.grey.shade900,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Gunty was born and raised in South Bend, Indiana. She graduated from the University of Notre Dame with a Bachelor of Arts in English and from New York University.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 22),
            Text(
              "Products",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Colors.grey.shade900,
              ),
            ),
            SizedBox(height: 14),
            GridView.builder(
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
          ],
        ),
      ),
    );
  }
}
