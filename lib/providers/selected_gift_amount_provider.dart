import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_gift_amount_provider.g.dart';

@riverpod
class SelectedGiftAmount extends _$SelectedGiftAmount {
  @override
  int? build() {
    return null;
  }

  void setSelectedAmount(int? amount) async {
    if (state == amount) {
      state = null;
    } else {
      state = amount;
    }
  }
}
