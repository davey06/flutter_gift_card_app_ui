import 'package:flutter/material.dart';
import 'package:flutter_card_app_ui/gen/assets.gen.dart';
import 'package:flutter_card_app_ui/providers/selected_card_provider.dart';
import 'package:flutter_card_app_ui/providers/selected_gift_amount_provider.dart';
import 'package:flutter_card_app_ui/utilities/app_text.dart';
import 'package:flutter_card_app_ui/utilities/constant.dart';
import 'package:flutter_card_app_ui/widgets/custom_arc_painter.dart';
import 'package:flutter_card_app_ui/widgets/custom_card_stamp_widget.dart';
import 'package:flutter_card_app_ui/widgets/custom_gift_card_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

class CardPurchasedScreen extends ConsumerWidget {
  const CardPurchasedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCard = ref.watch(selectedCardProvider);
    final size = MediaQuery.of(context).size;
    final selectedGiftAmount = ref.watch(selectedGiftAmountProvider);

    return WillPopScope(
      onWillPop: () async {
        Navigator.popUntil(context, (route) => route.isFirst);
        return false;
      },
      child: Scaffold(
        backgroundColor: selectedCard.value?.bgColor,
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
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Container(
                height: size.height / 2,
                padding: const EdgeInsets.only(left: 38, right: 38, top: 16),
                child: selectedCard.when(
                    data: (card) => Container(
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
                          child: Stack(
                            children: [
                              CustomGiftCard(
                                model: card,
                                width: size.width - 50,
                                showLabel: false,
                              ),
                              if (selectedGiftAmount != null)
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: CustomCardStamp(
                                      value: selectedGiftAmount),
                                )
                            ],
                          ),
                        ),
                    error: (e, s) => Center(
                          child: AppText.medium("Card not found: $e"),
                        ),
                    loading: () => const Center(
                          child: CircularProgressIndicator(),
                        )),
              ),
            ),
            Hero(
              tag: "BottomSheet",
              child: _BottomSheetSection(
                  giftAmount: selectedGiftAmount ?? 0,
                  height: size.height / 2.9),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomSheetSection extends ConsumerWidget {
  final double? height;
  final int giftAmount;
  const _BottomSheetSection({required this.giftAmount, this.height, Key? key})
      : super(key: key);
  final arcCount = 24;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final uuid = const Uuid().v1().replaceAll('-', '').substring(0, 16);

    return Stack(
      children: [
        Positioned(
          top: 1,
          child: CustomArcLines(screenWidth: size.width, arcCount: arcCount),
        ),
        Container(
          margin: EdgeInsets.only(top: size.width / arcCount / 2),
          padding: const EdgeInsets.all(24).copyWith(bottom: 10),
          color: Colors.white,
          width: double.infinity,
          height: height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppText.large(
                "Card Sent!",
                fontWeight: FontWeight.w900,
              ),
              const SizedBox(height: 8),
              AppText.medium(
                "gracesaraswati@gmail.com",
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.icon.gift1.svg(),
                    const SizedBox(width: 8),
                    AppText.title(
                      giftAmount.toDollar(),
                      color: Colors.black87,
                      fontSize: 30,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: Divider(thickness: 1),
              ),
              AppText.medium(
                "Card Number $uuid",
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                    child: AppText.medium(
                      'Share this',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
