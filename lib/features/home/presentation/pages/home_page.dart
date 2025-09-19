import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/core/assets/app_icons.dart';
import 'package:project/core/assets/app_images.dart';
import 'package:project/core/theme/app_colors.dart';
import 'package:project/core/widgets/app_buttons.dart';
import 'package:project/features/home/presentation/cubit/home_cubit.dart';
import 'package:project/features/home/presentation/pages/author_list_page.dart';
import 'package:project/features/home/presentation/pages/vendors_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<_Page> _offerPages = [
    _Page(image: AppImages.offer, title: 'Discount 25%'),
    _Page(image: AppImages.offer, title: 'Discount 30%'),
    _Page(image: AppImages.offer, title: 'Discount 50%'),
  ];
  final PageController _controller = PageController();

  final List<Map<String, String>> books = [
    {"title": "The Kite Runner", "price": "\$14.99", 'image': AppImages.top1},
    {"title": "The Kite Runner", "price": "\$20.99", 'image': AppImages.top2},
    {"title": "The Kite Runner", "price": "\$14.99", 'image': AppImages.top3},
    {"title": "The Kite Runner", "price": "\$14.99", 'image': AppImages.top1},
    {"title": "The Kite Runner", "price": "\$20.99", 'image': AppImages.top2},
    {"title": "The Kite Runner", "price": "\$14.99", 'image': AppImages.top3},
  ];

  final List<String> vendors = [
    AppImages.vendor1,
    AppImages.vendor2,
    AppImages.vendor3,
    AppImages.vendor4,
    AppImages.vendor1,
    AppImages.vendor2,
    AppImages.vendor3,
    AppImages.vendor4,
  ];

  final List<Map<String, String>> authors = [
    {"name": "John Freeman", "role": "Writer", 'image': AppImages.author1},
    {"name": "Tess Gunty", "role": "Novelist", 'image': AppImages.author2},
    {"name": "Richard Per", "role": "Writer", 'image': AppImages.author3},
    {"name": "John Freeman", "role": "Writer", 'image': AppImages.author1},
    {"name": "Tess Gunty", "role": "Novelist", 'image': AppImages.author2},
    {"name": "Richard Per", "role": "Writer", 'image': AppImages.author3},
  ];

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getBooks();  
  }

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
          "Home",
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
          Column(
            children: [
              // Special Offer
              Column(
                spacing: 8,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                      top: 16,
                    ),
                    child: SizedBox(
                      height: 146,
                      child: PageView.builder(
                        controller: _controller,
                        itemCount: _offerPages.length,
                        itemBuilder: (context, index) {
                          final page = _offerPages[index];
                          return Container(
                            height: 146,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                              color: Colors.grey.shade50,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 32,
                                    vertical: 24,
                                  ),
                                  child: Column(
                                    spacing: 13,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text.rich(
                                        TextSpan(
                                          text: 'Special Offer\n',
                                          style: TextStyle(
                                            color: Colors.grey.shade900,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: page.title,
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey.shade900,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 118,
                                        height: 36,
                                        child: HomeButton(
                                          onPressed: () {},
                                          title: 'Order Now',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Image.asset(page.image, fit: BoxFit.cover),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.center,
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: _offerPages.length,
                      effect: ScaleEffect(
                        activeDotColor: AppColors.primaryColor,
                        dotWidth: 4,
                        dotHeight: 4,
                        spacing: 8,
                        scale: 2.0,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 27),

              // Top of Week
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 22),
                      child: _sectionHeader("Top of Week", onSeeAll: () {}),
                    ),

                    SizedBox(height: 16),

                    SizedBox(
                      height: 220,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: books.length,
                        itemBuilder: (context, index) {
                          final book = books[index];
                          return Container(
                            width: 127,
                            margin: EdgeInsets.only(right: 12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(12),
                                      bottom: Radius.circular(12),
                                    ),
                                    child: Image.asset(
                                      book['image']!,
                                      fit: BoxFit.cover,
                                      height: 150,
                                      width: 127,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                  ),
                                  child: Text(
                                    book['title']!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Colors.grey.shade900,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                  ),
                                  child: Text(
                                    book['price']!,
                                    style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 32),

              // Vendors
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 22),
                      child: _sectionHeader(
                        "Best Vendors",
                        onSeeAll: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VendorsPage(),
                            ),
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 16),

                    SizedBox(
                      height: 80,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: vendors.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 80,
                            height: 80,
                            margin: EdgeInsets.only(right: 12),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: AssetImage(vendors[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 32),

              // // Authors
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 22),
                      child: _sectionHeader(
                        "Authors",
                        onSeeAll: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AuthorListPage(),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      height: 183,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: authors.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 127,
                            height: 183,
                            margin: EdgeInsets.only(right: 16),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(
                                    authors[index]['image']!,
                                  ),
                                  radius: 55,
                                ),
                                SizedBox(height: 15),
                                Text(
                                  authors[index]["name"]!,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade900,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  authors[index]["role"]!,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _sectionHeader(String title, {required VoidCallback onSeeAll}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      TextButton(onPressed: onSeeAll, child: Text("See all")),
    ],
  );
}

class _Page {
  final String image;
  final String title;

  _Page({required this.image, required this.title});
}
