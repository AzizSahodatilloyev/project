import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/core/assets/app_icons.dart';
import 'package:project/core/theme/app_colors.dart';

class CustomKeyboard extends StatelessWidget {
  final void Function(String)? onKeyTap;
  final VoidCallback? onBackspace;
  final Color backgroundColor;
  final Color numColor;

  const CustomKeyboard({
    super.key,
    required this.onKeyTap,
    required this.onBackspace,
    this.backgroundColor = AppColors.primaryColor,
    this.numColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    final keys = [
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
      ".",
      "0",
      "back",
    ];

    return GridView.count(
      padding: EdgeInsets.only(top: 16),
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: 25 / 16,
      physics: NeverScrollableScrollPhysics(),
      children: keys.map((key) {
        if (key == "back") {
          return ElevatedButton(
            onPressed: onBackspace,

            style: ElevatedButton.styleFrom(
              shadowColor: Colors.transparent,
              elevation: 0,
              backgroundColor: backgroundColor,
              padding: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(0)),
              ),
            ),
            child: Center(
              child: SvgPicture.asset(
                AppIcons.delete,
                width: 24,
                height: 24,
                color: Colors.grey.shade900,
              ),
            ),
          );
        }
        return ElevatedButton(
          onPressed: () => onKeyTap?.call(key),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shadowColor: Colors.transparent,
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0)),
            ),

            padding: const EdgeInsets.all(16),
          ),
          child: Text(
            key,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: numColor,
            ),
          ),
        );
      }).toList(),
    );
  }
}
