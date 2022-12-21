import 'package:flutter/material.dart';
import 'package:flutter_card_app_ui/gen/colors.gen.dart';
import 'package:flutter_card_app_ui/utilities/app_text.dart';

class CustomLabelTextFieldWidget extends StatelessWidget {
  const CustomLabelTextFieldWidget({
    required this.label,
    required this.placeholder,
    this.maxLine,
    Key? key,
  }) : super(key: key);
  final String label;
  final String placeholder;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.medium(
          label,
          color: Colors.black87,
          fontSize: 16,
          fontWeight: FontWeight.w900,
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: ColorName.lightGrey,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: ColorName.primaryColor,
                fontSize: 14),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: placeholder,
                hintStyle: const TextStyle(color: Colors.grey)),
            maxLines: maxLine,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
