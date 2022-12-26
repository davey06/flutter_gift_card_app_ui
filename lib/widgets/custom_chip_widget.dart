import 'package:flutter/material.dart';

import '../gen/colors.gen.dart';
import '../utilities/app_text.dart';

class CustomChips extends StatelessWidget {
  final String label;
  final bool isSelected;
  final double? height;
  final Color? focusColor;
  final Function()? onTap;

  const CustomChips({
    Key? key,
    required this.label,
    required this.isSelected,
    this.focusColor,
    this.height,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 10.0),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: isSelected
              ? focusColor ?? ColorName.primaryColor
              : ColorName.disabledGrey,
        ),
        child: Center(
          child: AppText.small(
            label,
            color: isSelected ? Colors.white : focusColor ?? ColorName.darkGrey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
