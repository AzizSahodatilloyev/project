import 'package:flutter/material.dart';
import 'package:project/core/assets/app_images.dart';
import 'package:project/core/theme/app_colors.dart';

class CategoryItems extends StatelessWidget {
  CategoryItems({super.key});
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
    return Padding(
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
                  child: Image.asset(product["image"]!, fit: BoxFit.cover),
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
                  color: AppColors.primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
