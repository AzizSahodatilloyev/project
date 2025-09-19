import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/core/assets/app_icons.dart';
import 'package:project/core/assets/app_images.dart';
import 'package:project/core/theme/app_colors.dart';
import 'package:project/features/profile/presentation/widgets/profile_account_field.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _MySearchPageState();
}

class _MySearchPageState extends State<SearchPage> {
  final List<SearchedBooks> books = [
    SearchedBooks(
      name: "The Da Vinci Code",
      price: "\$19.99",
      image: AppImages.product1,
    ),
    SearchedBooks(
      name: "Carrie Fisher",
      price: "\$27.12",
      image: AppImages.product2,
    ),
    SearchedBooks(
      name: "The Good Sister",
      price: "\$27.12",
      image: AppImages.product3,
    ),
    SearchedBooks(
      name: "The Waiting",
      price: "\$27.12",
      image: AppImages.product4,
    ),
    SearchedBooks(
      name: "Where Are You",
      price: "\$31.99",
      image: AppImages.product5,
    ),
    SearchedBooks(
      name: "Bright Young Woman",
      price: "\$24.49",
      image: AppImages.product6,
    ),
  ];

  List<SearchedBooks> filteredBooks = [];
  List<SearchedBooks> resentSearch = [
    SearchedBooks(
      name: "The Good Sister",
      price: "\$27.12",
      image: AppImages.product3,
    ),
    SearchedBooks(
      name: "Bright Young Woman",
      price: "\$24.49",
      image: AppImages.product6,
    ),
  ];
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(AppIcons.arrowLeftOutline),
        ),
        title: Text(
          "Search",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.greyscale900,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: ProfileAccountField(
              onChanged: (value) {
                filteredBooks.clear();
                for (var e in books) {
                  if (e.name.trim().toLowerCase().contains(
                    controller.text.toLowerCase(),
                  )) {
                    filteredBooks.add(e);
                  }
                }
                setState(() {});
              },
              borderColor: AppColors.greyscale500,
              title: "Search",
              controller: controller,
              prefix: Image.asset(
                AppIcons.search,
                colorBlendMode: BlendMode.srcIn,
                color: AppColors.greyscale500,
              ),
              isTitle: false,
            ),
          ),
          Expanded(
            child: filteredBooks.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 12,
                        mainAxisExtent: 225,
                        crossAxisCount: 2,
                      ),
                      itemCount: books.length,
                      itemBuilder: (context, index) {
                        final item = books[index];
                        return Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 150,
                                width: double.infinity,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    item.image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                item.name,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  // color: AppColors.greyscale500,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                item.price,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Recent Searches",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.greyscale900,
                          ),
                        ),
                        SizedBox(height: 20),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: resentSearch.length <= 4
                              ? resentSearch.length
                              : 4,
                          itemBuilder: (context, index) {
                            final item = resentSearch[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 12),
                                Text(
                                  item.name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.greyscale500,
                                  ),
                                ),
                                SizedBox(height: 12),
                                Divider(color: AppColors.greyscale100),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class SearchedBooks {
  final String name;
  final String price;
  final String image;
  SearchedBooks({required this.name, required this.price, required this.image});
}
