import 'package:flutter/material.dart';
import 'package:flutter_card_app_ui/gen/colors.gen.dart';
import 'package:flutter_card_app_ui/utilities/app_text.dart';

class CustomChips extends StatelessWidget {
  final String label;
  final bool isSelected;
  final double? height;
  final Color? customFocusColor;
  final double labelFontSize;
  final VoidCallback? onTap;
  const CustomChips(
      {required this.label,
      required this.isSelected,
      this.customFocusColor,
      this.labelFontSize = 12,
      this.height,
      this.onTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: isSelected
                ? customFocusColor ?? ColorName.primaryColor
                : ColorName.disabledGrey),
        child: Center(
          child: AppText.small(
            label,
            fontSize: labelFontSize,
            color: isSelected
                ? Colors.white
                : customFocusColor ?? ColorName.darkGrey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
