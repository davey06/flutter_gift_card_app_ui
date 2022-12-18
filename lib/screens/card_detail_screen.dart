import 'package:flutter/material.dart';
import 'package:flutter_card_app_ui/gen/assets.gen.dart';
import 'package:flutter_card_app_ui/providers/selected_card_provider.dart';
import 'package:flutter_card_app_ui/providers/selected_gift_amount_provider.dart';
import 'package:flutter_card_app_ui/utilities/app_text.dart';
import 'package:flutter_card_app_ui/utilities/constant.dart';
import 'package:flutter_card_app_ui/widgets/custom_chip_widget.dart';
import 'package:flutter_card_app_ui/widgets/custom_gift_card_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CardDetailScreen extends ConsumerWidget {
  const CardDetailScreen({required this.cardId, Key? key}) : super(key: key);
  final int cardId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final selectedCard = ref.watch(SelectedCardProvider(cardId));
    final selectedCardNotifier =
        ref.read(SelectedCardProvider(cardId).notifier);
    final selectedGiftAmount = ref.watch(selectedGiftAmountProvider);

    return Scaffold(
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
              Navigator.pop(context);
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
              padding: const EdgeInsets.all(16.0).copyWith(bottom: 0),
              child: selectedCard.when(
                  data: (card) => Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              selectedCardNotifier.prevCard();
                            },
                            child:
                                Assets.icon.arrowleft.svg(color: Colors.white),
                          ),
                          Flexible(
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
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
                                      child: _GiftStamp(
                                        value: selectedGiftAmount,
                                      ),
                                    )
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              selectedCardNotifier.nextCard();
                            },
                            child:
                                Assets.icon.arrowright.svg(color: Colors.white),
                          ),
                        ],
                      ),
                  error: (e, s) => Center(
                        child: AppText.medium("Card not found: $e"),
                      ),
                  loading: () => const Center(
                        child: CircularProgressIndicator(),
                      )),
            ),
          ),
          const _CustomizeButton(),
          _GiftAmountSection(height: size.height / 3.5),
        ],
      ),
    );
  }
}

class _GiftStamp extends StatelessWidget {
  final int value;
  const _GiftStamp({required this.value, Key? key}) : super(key: key);

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

class _GiftAmountSection extends ConsumerWidget {
  final double? height;
  const _GiftAmountSection({this.height, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedAmount = ref.watch(selectedGiftAmountProvider);
    final isAmountSelected = selectedAmount != null;

    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      color: Colors.white,
      width: double.infinity,
      height: height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AppText.medium(
            "Select Amount",
            fontWeight: FontWeight.w900,
            fontSize: 16,
          ),
          SizedBox(
            height: 50,
            child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  const SizedBox(width: 24),
                  ...giftValue
                      .map((value) => CustomChips(
                            label: value.toDollar(),
                            isSelected: selectedAmount == value,
                            customFocusColor: Colors.black87,
                            labelFontSize: 16,
                            onTap: () {
                              ref
                                  .read(selectedGiftAmountProvider.notifier)
                                  .setSelectedAmount(value);
                            },
                          ))
                      .toList(growable: false),
                  const SizedBox(width: 24),
                ]),
          ),
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
    );
  }
}

class _CustomizeButton extends StatelessWidget {
  const _CustomizeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Assets.icon.color.svg(color: Colors.white, height: 16),
          const SizedBox(width: 12),
          AppText.small(
            'Customize',
            color: Colors.white,
            letterSpacing: 1,
          )
        ],
      ),
    );
  }
}
