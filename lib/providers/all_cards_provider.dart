import 'package:flutter_card_app_ui/models/card_model.dart';
import 'package:flutter_card_app_ui/providers/selected_card_category_provider.dart';
import 'package:flutter_card_app_ui/repositories/card_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'all_cards_provider.g.dart';

@riverpod
Future<List<CardModel>> allCards(AllCardsRef ref) async {
  final cardRepo = ref.watch(cardRepositoryProvider);
  final selectedCategory = ref.watch(selectedCategoryProvider);
  final allCard = await cardRepo.getAllCards();
  if (selectedCategory != null) {
    return allCard
        .where((card) =>
            card.categories.any((category) => category == selectedCategory))
        .toList(growable: false);
  } else {
    return allCard;
  }
}
