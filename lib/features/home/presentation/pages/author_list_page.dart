import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/core/assets/app_icons.dart';
import 'package:project/core/assets/app_images.dart';
import 'package:project/core/theme/app_colors.dart';
import 'package:project/features/home/presentation/pages/authors_page.dart';

class AuthorListPage extends StatefulWidget {
  const AuthorListPage({super.key});

  @override
  State<AuthorListPage> createState() => _AuthorListPageState();
}

class _AuthorListPageState extends State<AuthorListPage> {
  final authors = [
    {
      "name": "John Freeman",
      "desc": "American writer he was the editor of the",
      "image": AppImages.author1,
    },
    {
      "name": "Austin Wick",
      "desc": "British novelsit all over the world of the ",
      "image": AppImages.author2,
    },
    {
      "name": "Adam Dalva",
      "desc": "He is the senior fiction editor of guernica ma",
      "image": AppImages.author3,
    },
    {
      "name": "Abraham verghese",
      "desc": "He is the professor and Linda R. Meier and",
      "image": AppImages.author4,
    },
    {
      "name": "Tess Gunty",
      "desc": "Gunty was born and raised in south bend,indiana",
      "image": AppImages.author5,
    },
    {
      "name": "Ann Napolitano",
      "desc": "She is the author of the novels A Good Hard",
      "image": AppImages.author6,
    },
    {
      "name": "Hernan Diaz",
      "desc": "Pulitzer Prize-winning novelist",
      "image": AppImages.author7,
    },
  ];

  @override
  Widget build(BuildContext context) {
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
                    "Check the Authors",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "Authors",
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
                  _tabItem("Poets", false),
                  SizedBox(width: 18),
                  _tabItem("Playwrights", false),
                  SizedBox(width: 18),
                  _tabItem("Novelists", false),
                  SizedBox(width: 18),
                  _tabItem("Journals", false),
                ],
              ),
            ),
          ),
          // List
          Expanded(
            child: ListView.builder(
              itemCount: authors.length,
              itemBuilder: (context, index) {
                final author = authors[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(author["image"]!),
                    radius: 36,
                  ),
                  title: Text(
                    author["name"]!,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Text(
                    author["desc"]!,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF66707A),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AuthorsPage(author: author),
                      ),
                    );
                  },
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
