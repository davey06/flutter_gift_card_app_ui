import 'package:flutter_card_app_ui/models/card_model.dart';
import 'package:flutter_card_app_ui/providers/search_query_provider.dart';
import 'package:flutter_card_app_ui/providers/selected_card_category_provider.dart';
import 'package:flutter_card_app_ui/repositories/card_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'all_cards_provider.g.dart';

@riverpod
Future<List<CardModel>> allCards(AllCardsRef ref) async {
  final cardRepo = ref.watch(cardRepositoryProvider);
  final selectedCategory = ref.watch(selectedCategoryProvider);
  final searchQuery = ref.watch(searchQueryProvider);
  var allCard = await cardRepo.getAllCards();
  if (selectedCategory != null) {
    allCard = allCard
        .where((card) =>
            card.categories.any((category) => category == selectedCategory))
        .toList(growable: false);
  }
  if (searchQuery.trim().isNotEmpty) {
    allCard = allCard
        .where((card) =>
            card.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList(growable: false);
  }
  return allCard;
}
