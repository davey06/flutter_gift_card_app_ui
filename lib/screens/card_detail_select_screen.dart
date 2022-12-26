import 'package:flutter/material.dart';
import 'package:flutter_card_app_ui/widgets/custom_app_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../gen/assets.gen.dart';
import '../models/card_model.dart';
import '../providers/selected_card_provider.dart';
import '../providers/selected_gift_amount_provider.dart';
import '../utilities/app_text.dart';
import '../widgets/custom_chip_widget.dart';
import '../widgets/custom_gift_card.dart';
import 'card_detail_input_data_screen.dart';

class CardDetailScreen extends ConsumerWidget {
  final int cardId;

  const CardDetailScreen({
    Key? key,
    required this.cardId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCard = ref.watch(selectedCardProvider);

    return Scaffold(
      backgroundColor: selectedCard.value?.bgColor,
      appBar: const CustomAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const _SelectedCard(),
          const _CustomizeButton(),
          Hero(
            tag: "BottomSheet",
            child: _GiftCardValue(
              model: selectedCard.value,
            ),
          ),
        ],
      ),
    );
  }
}

class _SelectedCard extends ConsumerWidget {
  const _SelectedCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final selectedCard = ref.watch(selectedCardProvider);
    final selectedCardNotifier = ref.read(selectedCardProvider.notifier);
    final selectedGiftAmount = ref.watch(selectedGiftAmountProvider);

    return Container(
      height: size.height * 0.5,
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: selectedCard.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (card) => Row(
          children: [
            IconButton(
              onPressed: () => selectedCardNotifier.prevCard(),
              icon: Assets.icon.arrowleft.svg(color: Colors.white),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5.0,
                      spreadRadius: 2,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: CustomGiftCard(
                  model: card,
                  width: size.width,
                  value: selectedGiftAmount,
                  showValue: selectedGiftAmount != null,
                  showLabel: false,
                ),
              ),
            ),
            IconButton(
              onPressed: () => selectedCardNotifier.nextCard(),
              icon: Assets.icon.arrowright.svg(color: Colors.white),
            ),
          ],
        ),
        error: (e, s) => Center(child: AppText.medium("Card not found: $e")),
      ),
    );
  }
}

class _CustomizeButton extends StatelessWidget {
  const _CustomizeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Assets.icon.color.svg(color: Colors.white, height: 20),
          const SizedBox(width: 10),
          AppText.small('Customize', color: Colors.white, letterSpacing: 1)
        ],
      ),
    );
  }
}

class _GiftCardValue extends ConsumerWidget {
  final CardModel? model;

  const _GiftCardValue({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final selectedAmount = ref.watch(selectedGiftAmountProvider);
    final isAmountSelected = selectedAmount != null;
    final selectedCard = model;

    return Container(
      padding: const EdgeInsets.only(
        bottom: 10.0,
        left: 20.0,
        right: 20.0,
      ),
      color: Colors.white,
      width: double.infinity,
      height: size.height * 0.25,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(height: 10),
          AppText.medium("Select Amount", fontSize: 16),
          SizedBox(
            height: 50,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                ...[50, 100, 200, 500, 1000].map(
                  (value) {
                    return CustomChips(
                      label: '\$$value',
                      focusColor: Colors.black87,
                      isSelected: selectedAmount == value,
                      onTap: () {
                        ref
                            .read(selectedGiftAmountProvider.notifier)
                            .setSelectedAmount(value);
                      },
                    );
                  },
                ).toList(),
                const SizedBox(width: 24),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              isAmountSelected && selectedCard != null
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CardDetailInputScreen(
                          model: selectedCard,
                          giftValue: selectedAmount,
                        ),
                      ),
                    )
                  : null;
            },
            style: ElevatedButton.styleFrom(
              fixedSize: Size(size.width, 50),
              backgroundColor: isAmountSelected ? Colors.black87 : Colors.grey,
              shape: const StadiumBorder(),
            ),
            child: AppText.medium('Continue', color: Colors.white),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
