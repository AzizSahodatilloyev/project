import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/core/assets/app_icons.dart';
import 'package:project/core/theme/app_colors.dart';
import 'package:project/features/home/presentation/pages/home_page.dart';
import 'package:project/features/profile/presentation/pages/account_page.dart';
import 'package:project/features/profile/presentation/pages/favorites_page.dart';
import 'package:project/features/profile/presentation/pages/help_center_pgae.dart';
import 'package:project/features/profile/presentation/pages/log_out.dart';
import 'package:project/features/profile/presentation/pages/order_history_page.dart';
import 'package:project/features/profile/presentation/pages/promo_code_page.dart';

class ProfilPage extends StatelessWidget {
  ProfilPage({super.key});
  final List<Options> settings = [
    Options(
      title: "My Account",
      page: AccountPage(),
      path: AppIcons.profileFill,
    ),
    Options(title: "Address", page: HomePage(), path: AppIcons.locationFill),
    Options(
      title: "Offers & Promos",
      page: PromoCodePage(),
      path: AppIcons.fire,
    ),
    Options(
      title: "Your Favorites",
      page: FavoritesPage(),
      path: AppIcons.loveFill,
    ),
    Options(
      title: "Order History",
      page: OrderHistoryPage(),
      path: AppIcons.calendar,
    ),
    Options(
      title: "Help Center",
      page: HelpCenterPgae(),
      path: AppIcons.cahtFill,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.grey.shade900,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 24),
          Divider(color: const Color.fromRGBO(232, 232, 232, 1)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColors.primary200,
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(),
                        Text(
                          "Aziz Sakhodatillayev",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey.shade900,
                          ),
                        ),
                        Text(
                          "+998 50 030 1576",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        SizedBox(),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32),
                            ),
                          ),
                          showDragHandle: true,
                          backgroundColor: AppColors.white,
                          scrollControlDisabledMaxHeightRatio: 320,
                          builder: (context) => LogOut(),
                        );
                      },
                      child: Text(
                        "Logout",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(color: AppColors.greyscale200),
          ListView.builder(
            shrinkWrap: true,
            itemCount: settings.length,
            itemBuilder: (context, index) {
              final item = settings[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => item.page),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 22,
                            backgroundColor: AppColors.primary50,
                            child: SvgPicture.asset(
                              item.path,
                              colorFilter: ColorFilter.mode(
                                AppColors.primaryColor,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          SizedBox(width: 16),

                          Text(
                            item.title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade900,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: null,
                            icon: SvgPicture.asset(
                              AppIcons.chevronRight,
                              colorFilter: ColorFilter.mode(
                                AppColors.greyscale500,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Options {
  final String title;
  final String path;
  final Widget page;
  Options({required this.title, required this.page, required this.path});
}
