import 'package:flutter/material.dart';
import 'package:flutter_card_app_ui/gen/assets.gen.dart';
import 'package:flutter_card_app_ui/providers/selected_card_provider.dart';
import 'package:flutter_card_app_ui/utilities/app_text.dart';
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
      body: selectedCard.when(
          data: (card) => Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
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
                                      offset: Offset(5, 5)),
                                ],
                              ),
                              child: CustomGiftCard(
                                model: card,
                                width: size.width - 50,
                                showLabel: false,
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
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    height: size.height / 4,
                  )
                ],
              ),
          error: (e, s) => Center(
                child: AppText.medium("Card not found: $e"),
              ),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
