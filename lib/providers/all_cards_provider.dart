import 'package:flutter_card_app_ui/models/card_model.dart';
import 'package:flutter_card_app_ui/repositories/card_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'all_cards_provider.g.dart';

@riverpod
Future<List<CardModel>> allCards(AllCardsRef ref) async {
  final cardRepo = ref.watch(cardRepositoryProvider);
  return cardRepo.getAllCards();
}
