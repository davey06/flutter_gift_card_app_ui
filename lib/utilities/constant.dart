const giftValue = [50, 100, 200, 500, 1000];

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

extension MoneyExtention on num {
  String toDollar() => '\$$this';
}
