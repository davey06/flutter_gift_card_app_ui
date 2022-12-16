import 'package:flutter_card_app_ui/models/card_model.dart';
import 'package:flutter_card_app_ui/repositories/card_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_card_provider.g.dart';

@riverpod
class SelectedCard extends _$SelectedCard {
  @override
  Future<CardModel> build() async {
    final cardRepository = ref.watch(cardRepositoryProvider);
    return await cardRepository.getCard('1');
  }

  void setSelectedCard(String cardId) async {
    final cardRepository = ref.watch(cardRepositoryProvider);
    state = AsyncValue.data(
      await cardRepository.getCard(cardId),
    );
  }
}
