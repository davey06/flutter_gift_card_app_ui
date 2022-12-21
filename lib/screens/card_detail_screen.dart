import 'package:flutter/material.dart';
import 'package:flutter_card_app_ui/gen/assets.gen.dart';
import 'package:flutter_card_app_ui/providers/selected_card_provider.dart';
import 'package:flutter_card_app_ui/utilities/app_text.dart';
import 'package:flutter_card_app_ui/utilities/card_detail_page_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'card_detail_select_page.dart';

class CardDetailScreen extends ConsumerWidget {
  const CardDetailScreen({required this.cardId, Key? key}) : super(key: key);
  final int cardId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCard = ref.watch(selectedCardProvider);
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
      body: const Navigator(
          initialRoute: CardDetailSelectPage.route,
          onGenerateRoute: CardDetailPageRoutes.onGenerateRoute),
    );
  }
}
