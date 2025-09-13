import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/core/assets/app_icons.dart';
import 'package:project/core/widgets/app_buttons.dart';
import 'package:project/features/auth/presentation/pages/new_password_complete_page.dart';
import 'package:project/features/auth/presentation/widgets/reset_password_formfield.dart';

class NewPassswordPage extends StatefulWidget {
  const NewPassswordPage({super.key});

  @override
  State<NewPassswordPage> createState() => _NewPassswordPageState();
}

class _NewPassswordPageState extends State<NewPassswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(AppIcons.arrowLeftOutline),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Text(
                  'New Password',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey.shade900,
                  ),
                ),
                Text(
                  'Create your new password, so you can login to your account.',
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Column(
              spacing: 16,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 6,
                  children: [
                    Text(
                      'New Password',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade900,
                      ),
                    ),
                    NewResetPassword1(),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 6,
                  children: [
                    Text(
                      'Confirm Password',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade900,
                      ),
                    ),
                    NewResetPassword2(),
                  ],
                ),
              ],
            ),
            SizedBox(height: 36),
            AuthButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewPasswordCompletePage(),
                  ),
                );
              },
              title: 'Send',
            ),
          ],
        ),
      ),
    );
  }
}
