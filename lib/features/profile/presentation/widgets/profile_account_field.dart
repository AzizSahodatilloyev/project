import 'package:flutter/material.dart';
import 'package:project/core/theme/app_colors.dart';

class ProfileAccountField extends StatelessWidget {
  final String title;

  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffix;
  final Widget? prefix;

  final void Function(String)? onChanged;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool isTitle;
  final Color borderColor;
  const ProfileAccountField({
    super.key,
    required this.title,
    this.validator,
    this.obscureText = false,
    required this.controller,
    this.keyboardType,
    this.isTitle = true,
    this.borderColor = AppColors.greyscale50,
    this.suffix,
    this.onChanged, this.prefix,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isTitle
            ? Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade900,
                ),
              )
            : SizedBox(),
        SizedBox(height: 6),
        TextFormField(
          keyboardType: keyboardType,
          cursorColor: Colors.black,
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.greyscale50,
            suffix: suffix,
            hintText: title,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.greyscale400,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.red),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: borderColor),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: borderColor),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.red),
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
