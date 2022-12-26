import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/card_model.dart';

part 'selected_card_category_provider.g.dart';

@riverpod
class SelectedCategory extends _$SelectedCategory {
  @override
  CardCategory? build() {
    return null;
  }

  void setSelectedCategory(CardCategory? selected) async {
    if (state == selected) {
      state = null;
    } else {
      state = selected;
    }
  }
}
