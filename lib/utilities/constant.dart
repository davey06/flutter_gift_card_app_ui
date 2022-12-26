import '../models/card_model.dart';

extension CardCategoryExtention on CardCategory {
  String capitalName() =>
      name[0].toUpperCase() + name.substring(1, name.length).toLowerCase();
}

extension MoneyExtention on num {
  String toDollar() => '\$$this';
}
