import 'package:flutter/material.dart';
import 'package:flutter_card_app_ui/utilities/app_text.dart';
import 'package:flutter_card_app_ui/utilities/constant.dart';

class CustomCardStamp extends StatelessWidget {
  final int value;
  const CustomCardStamp({required this.value, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AppText.title(
            'USD',
            color: Colors.white,
            fontSize: 20,
          ),
          AppText.title(
            value.toDollar(),
            color: Colors.white,
            fontSize: 30,
          ),
        ],
      ),
    );
  }
}
