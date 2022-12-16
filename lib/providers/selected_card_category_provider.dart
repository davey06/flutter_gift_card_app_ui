import 'package:flutter_card_app_ui/models/card_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
