import 'package:flutter_card_app_ui/models/payment_option_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_payment_method_provider.g.dart';

@riverpod
class SelectedPaymentMethod extends _$SelectedPaymentMethod {
  @override
  PaymentOption? build() {
    return null;
  }

  void set(PaymentOption? option) async {
    state = option;
  }
}
