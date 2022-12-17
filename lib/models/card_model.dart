import 'dart:ui';

import 'package:flutter_card_app_ui/gen/assets.gen.dart';
import 'package:flutter_card_app_ui/gen/colors.gen.dart';
import 'package:flutter_card_app_ui/utilities/constant.dart';

class CardModel {
  final int id;
  final String name;
  final String thumbnailPath;
  final Color bgColor;
  final List<CardCategory> categories;

  const CardModel({
    required this.id,
    required this.name,
    required this.thumbnailPath,
    required this.categories,
    required this.bgColor,
  });

  static List<CardModel> sampleCards = [
    CardModel(
      id: 1,
      name: 'Christmas Doge',
      thumbnailPath: Assets.card.dogeXmas.path,
      categories: [CardCategory.general, CardCategory.christmas],
      bgColor: ColorName.bgBlue,
    ),
    CardModel(
      id: 2,
      name: 'Flowers Bouquet',
      thumbnailPath: Assets.card.flower.path,
      categories: [
        CardCategory.general,
        CardCategory.christmas,
        CardCategory.congratulation
      ],
      bgColor: ColorName.bgBlue,
    ),
    CardModel(
      id: 3,
      name: 'Ho Ho Ho',
      thumbnailPath: Assets.card.hohoho.path,
      categories: [CardCategory.general, CardCategory.christmas],
      bgColor: ColorName.bgOrange,
    ),
    CardModel(
      id: 4,
      name: 'Choco Cake',
      thumbnailPath: Assets.card.cakeBday.path,
      categories: [CardCategory.general, CardCategory.birthday],
      bgColor: ColorName.bgOrange,
    ),
    CardModel(
      id: 5,
      name: 'Happy Birthday',
      thumbnailPath: Assets.card.happyBday.path,
      categories: [CardCategory.general, CardCategory.birthday],
      bgColor: ColorName.bgOrange,
    ),
    CardModel(
      id: 6,
      name: 'Giving Season',
      thumbnailPath: Assets.card.giftXmas.path,
      categories: [CardCategory.general, CardCategory.christmas],
      bgColor: ColorName.bgOrange,
    ),
    CardModel(
      id: 7,
      name: 'Birthday Gift',
      thumbnailPath: Assets.card.giftHappy.path,
      categories: [CardCategory.general, CardCategory.birthday],
      bgColor: ColorName.bgBlue,
    ),
    CardModel(
      id: 8,
      name: 'Holly Jolly Socks',
      thumbnailPath: Assets.card.sockXmas.path,
      categories: [CardCategory.general, CardCategory.christmas],
      bgColor: ColorName.bgBlue,
    ),
  ];
}
