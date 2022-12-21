import 'package:flutter_card_app_ui/models/card_model.dart';
import 'package:flutter_card_app_ui/repositories/card_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_card_provider.g.dart';

@riverpod
class SelectedCard extends _$SelectedCard {
  int allCardsCount = 0;
  int cardId = 0;

  @override
  Future<CardModel> build() async {
    final cardRepository = ref.watch(cardRepositoryProvider);
    cardId = ref.watch(selectedCardIdProvider);
    allCardsCount = (await cardRepository.getAllCards()).length;

    return await cardRepository.getCard(cardId);
  }

  // Future<void> setSelectedCard(int cardId) async {
  //   state = const AsyncValue.loading();
  //   final cardRepository = ref.watch(cardRepositoryProvider);
  //   state = AsyncValue.data(
  //     await cardRepository.getCard(cardId),
  //   );
  // }

  void nextCard() {
    ref.read(selectedCardIdProvider.notifier).setSelectedCardId(
          cardId >= allCardsCount ? 1 : cardId + 1,
        );
  }

  void prevCard() {
    ref.read(selectedCardIdProvider.notifier).setSelectedCardId(
          cardId <= 1 ? allCardsCount : cardId - 1,
        );
  }
}

@riverpod
class SelectedCardId extends _$SelectedCardId {
  @override
  int build() {
    return 0;
  }

  void setSelectedCardId(int cardId) {
    state = cardId;
  }
}
