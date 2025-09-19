import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/core/assets/app_icons.dart';
import 'package:project/core/theme/app_colors.dart';
import 'package:project/core/widgets/app_buttons.dart';
import 'package:project/features/profile/presentation/widgets/profile_account_field.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _MyMyAccountPageState();
}

class _MyMyAccountPageState extends State<AccountPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isObs = true;

  @override
  void initState() {
    super.initState();
    nameController.text = "Aziz Sakhodatillayev";
    phoneController.text = "+998 50 030 1576";
    emailController.text = "mister@gmail.com";
    passwordController.text = "Aziz1234";
  }

  isChangeObs() {
    isObs = !isObs;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          "My Account",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.grey.shade900,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(AppIcons.arrowLeftOutline),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 176,
            child: Stack(
              children: [
                Container(
                  height: 74,
                  width: double.maxFinite,
                  color: AppColors.primary50,
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: AppColors.primary200,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Change Picture",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Column(
              children: [
                ProfileAccountField(title: "Name", controller: nameController),
                SizedBox(height: 16),
                ProfileAccountField(
                  title: "Phone",
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 16),
                ProfileAccountField(
                  title: "Email",
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 16),
                ProfileAccountField(
                  title: "PassWord",
                  controller: passwordController,
                  obscureText: isObs,
                  suffix: IconButton(
                    onPressed: () {
                      isChangeObs();
                    },
                    icon: SvgPicture.asset(
                      AppIcons.passwordOutline,

                      height: 24,
                      width: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AuthButton(
                    onPressed: () {
                      Navigator.pop(context);
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
