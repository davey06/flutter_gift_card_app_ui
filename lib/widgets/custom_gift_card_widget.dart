import 'package:flutter/material.dart';
import 'package:flutter_card_app_ui/models/card_model.dart';
import 'package:flutter_card_app_ui/utilities/app_text.dart';

class CustomGiftCard extends StatelessWidget {
  final CardModel model;
  final double width;
  final double? height;
  final bool showLabel;
  const CustomGiftCard(
      {required this.model,
      this.width = 150,
      this.height,
      this.showLabel = true,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          model.thumbnailPath,
          width: width,
          height: height,
          fit: BoxFit.fitWidth,
        ),
        if (showLabel) ...[
          const SizedBox(height: 8),
          AppText.medium(model.name),
        ]
      ],
    );
  }
}
