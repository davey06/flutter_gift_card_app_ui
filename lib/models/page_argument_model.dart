import 'package:flutter_card_app_ui/providers/selected_card_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'card_model.dart';

class CardDetailSelectPageArgument {
  final SelectedCard selectedCardNotifier;
  final AsyncValue<CardModel> selectedCard;

  CardDetailSelectPageArgument(
      {required this.selectedCardNotifier, required this.selectedCard});
}

class CardDetailInputPageArgument {
  final CardModel model;
  final int giftAmount;

  CardDetailInputPageArgument({required this.model, required this.giftAmount});
}
