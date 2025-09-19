import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/core/assets/app_icons.dart';
import 'package:project/core/theme/app_colors.dart';

class LoginEmailField extends StatelessWidget {
  LoginEmailField({super.key, required this.emailController});
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final TextEditingController emailController ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 1,
          ),
        ),
        fillColor: Colors.grey.shade50,
        filled: true,
        hintText: 'Your email',
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        if (!emailRegex.hasMatch(value)) {
          return 'Please enter a valid email';
        }
        return null;
      },
    );
  }
}

class LoginPasswordField extends StatefulWidget {
  final TextEditingController passwordController;
  const LoginPasswordField({super.key, required this.passwordController});

  @override
  State<LoginPasswordField> createState() => _LoginPasswordFieldState();
}

class _LoginPasswordFieldState extends State<LoginPasswordField> {
  bool _obsecurePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.passwordController,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      obscureText: _obsecurePassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 1,
          ),
        ),
        fillColor: Colors.grey.shade50,
        filled: true,
        hintText: 'Your password',
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                _obsecurePassword = !_obsecurePassword;
              });
            },
            child: _obsecurePassword
                ? SvgPicture.asset(
                    AppIcons.passwordOutline,
                    width: 24,
                    height: 24,
                  )
                : SvgPicture.asset(
                    AppIcons.passwordOutline,
                    width: 24,
                    height: 24,
                  ),
          ),
        ),
        suffixIconConstraints: BoxConstraints(minHeight: 12, minWidth: 12),
      ),
      validator: (value) => (value == null || value.isEmpty)
          ? 'Please enter your password'
          : null,
    );
  }
}
