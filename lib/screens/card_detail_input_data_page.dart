import 'package:flutter/material.dart';
import 'package:flutter_card_app_ui/gen/assets.gen.dart';
import 'package:flutter_card_app_ui/models/card_model.dart';
import 'package:flutter_card_app_ui/providers/selected_gift_amount_provider.dart';
import 'package:flutter_card_app_ui/utilities/app_text.dart';
import 'package:flutter_card_app_ui/utilities/constant.dart';
import 'package:flutter_card_app_ui/widgets/custom_gift_card_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CardDetailInputPage extends StatelessWidget {
  static const route = 'card_detail/input';
  const CardDetailInputPage(
      {required this.model, required this.giftAmount, Key? key})
      : super(key: key);
  final CardModel model;
  final int giftAmount;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: model.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: AppText.medium(
          'Sent Card',
          color: Colors.white,
          fontSize: 16,
        ),
        centerTitle: true,
        leading: Container(
          margin: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, //New
                    blurRadius: 5.0,
                    offset: Offset(2, 2)),
              ]),
          child: IconButton(
            icon: Assets.icon.back.svg(),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0).copyWith(bottom: 0),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26, //New
                      blurRadius: 5.0,
                      spreadRadius: 2,
                      offset: Offset(3, 3)),
                ],
              ),
              child: Hero(
                tag: "GiftCard",
                child: CustomGiftCard(
                  model: model,
                  width: size.width / 2 - 32,
                  showLabel: false,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: AppText.title(
              giftAmount.toDollar(),
              color: Colors.white,
              fontSize: 30,
              textAlign: TextAlign.center,
            ),
          ),
          Flexible(child: _GiftRecipientSection(height: size.height / 2)),
        ],
      ),
    );
  }
}

class _GiftRecipientSection extends ConsumerWidget {
  final double? height;
  const _GiftRecipientSection({this.height, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedAmount = ref.watch(selectedGiftAmountProvider);
    final isAmountSelected = selectedAmount != null;

    return Container(
      padding: const EdgeInsets.all(16).copyWith(bottom: 10),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      width: double.infinity,
      height: height,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: isAmountSelected ? () {} : null,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: isAmountSelected ? Colors.black87 : Colors.grey,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                  child: AppText.medium(
                    'Continue',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
