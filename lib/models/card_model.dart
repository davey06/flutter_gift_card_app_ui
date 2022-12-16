import 'package:flutter_card_app_ui/gen/assets.gen.dart';

class CardModel {
  final String id;
  final String name;
  final String thumbnailPath;
  final List<String> categories;

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
      categories: [],
    ),
    CardModel(
      id: '2',
      name: 'Flowers Bouquet',
      thumbnailPath: Assets.card.flower.path,
      categories: [],
    ),
    CardModel(
      id: '6',
      name: 'Ho Ho Ho',
      thumbnailPath: Assets.card.hohoho.path,
      categories: [],
    ),
    CardModel(
      id: '3',
      name: 'Choco Cake',
      thumbnailPath: Assets.card.cakeBday.path,
      categories: [],
    ),
    CardModel(
      id: '4',
      name: 'Happy Birthday',
      thumbnailPath: Assets.card.happyBday.path,
      categories: [],
    ),
    CardModel(
      id: '7',
      name: 'Giving Season',
      thumbnailPath: Assets.card.giftXmas.path,
      categories: [],
    ),
    CardModel(
      id: '5',
      name: 'Birthday Gift',
      thumbnailPath: Assets.card.giftHappy.path,
      categories: [],
    ),
    CardModel(
      id: '8',
      name: 'Holly Jolly Socks',
      thumbnailPath: Assets.card.sockXmas.path,
      categories: [],
    ),
  ];
}
