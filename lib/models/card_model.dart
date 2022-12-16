import 'package:flutter_card_app_ui/gen/assets.gen.dart';

class CardModel {
  final String id;
  final String name;
  final String thumbnailPath;
  final List<CardCategory> categories;

  const CardModel({
    required this.id,
    required this.name,
    required this.thumbnailPath,
    required this.categories,
  });

  static List<CardModel> sampleCards = [
    CardModel(
      id: '1',
      name: 'Christmas Doge',
      thumbnailPath: Assets.card.dogeXmas.path,
      categories: [CardCategory.general, CardCategory.christmas],
    ),
    CardModel(
      id: '2',
      name: 'Flowers Bouquet',
      thumbnailPath: Assets.card.flower.path,
      categories: CardCategory.values,
    ),
    CardModel(
      id: '6',
      name: 'Ho Ho Ho',
      thumbnailPath: Assets.card.hohoho.path,
      categories: [CardCategory.general, CardCategory.christmas],
    ),
    CardModel(
      id: '3',
      name: 'Choco Cake',
      thumbnailPath: Assets.card.cakeBday.path,
      categories: [CardCategory.general, CardCategory.birthday],
    ),
    CardModel(
      id: '4',
      name: 'Happy Birthday',
      thumbnailPath: Assets.card.happyBday.path,
      categories: [CardCategory.general, CardCategory.birthday],
    ),
    CardModel(
      id: '7',
      name: 'Giving Season',
      thumbnailPath: Assets.card.giftXmas.path,
      categories: [CardCategory.general, CardCategory.christmas],
    ),
    CardModel(
      id: '5',
      name: 'Birthday Gift',
      thumbnailPath: Assets.card.giftHappy.path,
      categories: [CardCategory.general, CardCategory.birthday],
    ),
    CardModel(
      id: '8',
      name: 'Holly Jolly Socks',
      thumbnailPath: Assets.card.sockXmas.path,
      categories: [CardCategory.general, CardCategory.christmas],
    ),
  ];
}

enum CardCategory {
  birthday,
  christmas,
  general,
  congratulation,
}

extension CardCategoryExtention on CardCategory {
  String capitalName() =>
      name[0].toUpperCase() + name.substring(1, name.length).toLowerCase();
}
