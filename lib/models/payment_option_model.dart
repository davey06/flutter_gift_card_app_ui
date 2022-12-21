import 'package:flutter_card_app_ui/gen/assets.gen.dart';

class PaymentOption {
  final String name;
  final int? number;
  final PaymentOptionType type;
  final String iconUrl;

  PaymentOption({
    required this.name,
    this.number,
    required this.type,
    required this.iconUrl,
  });

  static final samples = [
    PaymentOption(
      name: 'MasterCard',
      number: 4180,
      type: PaymentOptionType.creditCard,
      iconUrl: Assets.icon.mc.path,
    ),
    PaymentOption(
      name: 'Paypal',
      type: PaymentOptionType.digitalWallet,
      iconUrl: Assets.icon.paypal.path,
    ),
  ];
}

enum PaymentOptionType {
  creditCard,
  digitalWallet,
}
