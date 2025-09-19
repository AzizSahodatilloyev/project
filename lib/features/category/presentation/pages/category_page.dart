import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/core/assets/app_icons.dart';
import 'package:project/core/theme/app_colors.dart';
import 'package:project/features/category/presentation/pages/search_page.dart';
import 'package:project/features/category/presentation/widgets/category_items.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: SvgPicture.asset(AppIcons.search),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchPage()),
            );
          },
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
      body: DefaultTabController(
        length: 5,
        child: Column(
          children: [
            TabBar(
              unselectedLabelColor: AppColors.greyscale500,
              labelStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.greyscale900,
              ),
              labelColor: Colors.black,
              indicatorColor: Colors.black,

              unselectedLabelStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.greyscale500,
              ),
              isScrollable: true,
              tabs: [
                Tab(text: "All"),
                Tab(text: "Novels"),
                Tab(text: "Self Love"),
                Tab(text: "Science"),
                Tab(text: "Romantic"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  CategoryItems(),
                  CategoryItems(),
                  CategoryItems(),
                  CategoryItems(),
                  CategoryItems(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget _tabItem(String text, bool isActive) {
//   return Padding(
//     padding: const EdgeInsets.only(right: 16.0),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           text,
//           style: TextStyle(
//             fontSize: isActive ? 18 : 16,
//             fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
//             color: isActive ? Colors.grey.shade900 : Colors.grey.shade500,
//           ),
//         ),
//         if (isActive)
//           Container(
//             margin: const EdgeInsets.only(top: 4),
//             height: 2,
//             width: 24,
//             color: AppColors.primaryColor,
//           ),
//       ],
//     ),
//   );
// }




      // ListView(
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.only(left: 16),
      //       child: Container(
      //         height: 56,
      //         alignment: Alignment.center,
      //         child: ListView(
      //           scrollDirection: Axis.horizontal,

      //           children: [
      //             _tabItem("All", true),
      //             SizedBox(width: 18),
      //             _tabItem("Novels", false),
      //             SizedBox(width: 18),
      //             _tabItem("Self Love", false),
      //             SizedBox(width: 18),
      //             _tabItem("Science", false),
      //             SizedBox(width: 18),
      //             _tabItem("Romantic", false),
      //           ],
      //         ),
      //       ),
      //     ),
      //     SizedBox(height: 24),

      //     CategoryItems(),
      //   ],
      // ),
