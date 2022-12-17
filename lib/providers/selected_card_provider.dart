import 'package:flutter_card_app_ui/models/card_model.dart';
import 'package:flutter_card_app_ui/repositories/card_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_card_provider.g.dart';

@riverpod
class SelectedCard extends _$SelectedCard {
  int allCardsCount = 0;

  @override
  Future<CardModel> build(int cardId) async {
    final cardRepository = ref.watch(cardRepositoryProvider);
    allCardsCount = (await cardRepository.getAllCards()).length;
    return await cardRepository.getCard(cardId);
  }

  Future<void> setSelectedCard(int cardId) async {
    state = const AsyncValue.loading();
    final cardRepository = ref.watch(cardRepositoryProvider);
    state = AsyncValue.data(
      await cardRepository.getCard(cardId),
    );
  }

  void nextCard() {
    final currentId = state.value?.id ?? 0;
    setSelectedCard(
      currentId >= allCardsCount ? 1 : currentId + 1,
    );
  }

  void prevCard() {
    final currentId = state.value?.id ?? 0;
    setSelectedCard(
      currentId <= 1 ? allCardsCount : currentId - 1,
    );
  }
}
