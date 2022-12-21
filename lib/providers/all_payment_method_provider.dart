import 'package:flutter_card_app_ui/models/payment_option_model.dart';
import 'package:flutter_card_app_ui/repositories/payment_method_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'all_payment_method_provider.g.dart';

@riverpod
Future<List<PaymentOption>> paymentMethods(PaymentMethodsRef ref) async {
  final paymentMethodRepository = ref.watch(paymentMethodRepositoryProvider);
  return paymentMethodRepository.getPaymentMethods();
}
