import 'package:flutter/material.dart';
import 'package:flutter_card_app_ui/gen/colors.gen.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    this.prefixIcon,
    this.suffixIcon,
    this.placeholder = 'Search..',
    required this.onChange,
    super.key,
  });

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String placeholder;
  final Function(String) onChange;

  @override
  Widget build(BuildContext context) {
    final leadingWidget = prefixIcon;
    final endingWidget = suffixIcon;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: ColorName.lightGrey,
      ),
      child: Row(
        children: [
          if (leadingWidget != null) ...[
            leadingWidget,
            const SizedBox(width: 12),
          ],
          Flexible(
            child: TextField(
              decoration: InputDecoration(
                hintText: placeholder,
                border: InputBorder.none,
              ),
              onChanged: onChange,
            ),
          ),
          if (endingWidget != null) ...[
            const SizedBox(width: 12),
            endingWidget,
          ],
        ],
      ),
    );
  }
}
