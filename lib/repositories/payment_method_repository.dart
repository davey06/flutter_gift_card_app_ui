import 'package:flutter_card_app_ui/models/payment_option_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'payment_method_repository.g.dart';

@riverpod
PaymentMethodRepository paymentMethodRepository(
        PaymentMethodRepositoryRef ref) =>
    PaymentMethodRepository();

class PaymentMethodRepository {
  Future<List<PaymentOption>> getPaymentMethods() async {
    return Future.delayed(
      const Duration(milliseconds: 500),
      () {
        return PaymentOption.samples;
      },
    );
  }
}
