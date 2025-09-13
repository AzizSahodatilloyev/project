import 'package:flutter/material.dart';
import 'package:project/core/theme/app_colors.dart';

class SignupNameField extends StatelessWidget {
  const SignupNameField({super.key, required this.nameController});
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nameController,
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
            color: Color(AppColors.primaryColor),
            width: 1,
          ),
        ),
        fillColor: Colors.grey.shade50,
        filled: true,
        hintText: 'Your name',
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
      validator: (value) =>
          (value == null || value.isEmpty) ? 'Please enter your name' : null,
    );
  }
}

class SignupEmailField extends StatelessWidget {
  SignupEmailField({super.key, required this.emailController});

  final TextEditingController emailController;
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

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
            color: Color(AppColors.primaryColor),
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
      validator: (value) => (value == null || value.isEmpty)
          ? 'Please enter your email'
          : (!emailRegex.hasMatch(value))
          ? 'Please enter a valid email'
          : null,
    );
  }
}



