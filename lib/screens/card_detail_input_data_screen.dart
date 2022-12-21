import 'package:flutter/material.dart';
import 'package:flutter_card_app_ui/gen/assets.gen.dart';
import 'package:flutter_card_app_ui/gen/colors.gen.dart';
import 'package:flutter_card_app_ui/models/card_model.dart';
import 'package:flutter_card_app_ui/models/payment_option_model.dart';
import 'package:flutter_card_app_ui/providers/all_payment_method_provider.dart';
import 'package:flutter_card_app_ui/providers/selected_gift_amount_provider.dart';
import 'package:flutter_card_app_ui/providers/selected_payment_method_provider.dart';
import 'package:flutter_card_app_ui/utilities/app_text.dart';
import 'package:flutter_card_app_ui/utilities/constant.dart';
import 'package:flutter_card_app_ui/widgets/custom_gift_card_widget.dart';
import 'package:flutter_card_app_ui/widgets/custom_label_textfield_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CardDetailInputScreen extends StatelessWidget {
  static const route = 'card_detail/input';
  const CardDetailInputScreen(
      {required this.model, required this.giftAmount, Key? key})
      : super(key: key);
  final CardModel model;
  final int giftAmount;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: model.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: AppText.medium(
          'Sent Card',
          color: Colors.white,
          fontSize: 16,
        ),
        centerTitle: true,
        leading: Container(
          margin: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, //New
                    blurRadius: 5.0,
                    offset: Offset(2, 2)),
              ]),
          child: IconButton(
            icon: Assets.icon.back.svg(),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0).copyWith(bottom: 0),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26, //New
                      blurRadius: 5.0,
                      spreadRadius: 2,
                      offset: Offset(3, 3)),
                ],
              ),
              child: CustomGiftCard(
                model: model,
                showLabel: false,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: AppText.title(
              giftAmount.toDollar(),
              color: Colors.white,
              fontSize: 30,
              textAlign: TextAlign.center,
            ),
          ),
          Flexible(
              child: Hero(
                  tag: "BottomSheet",
                  child: Material(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      child:
                          _GiftRecipientSection(height: size.height * 2 / 3)))),
        ],
      ),
    );
  }
}

class _GiftRecipientSection extends ConsumerWidget {
  final double? height;
  const _GiftRecipientSection({this.height, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedAmount = ref.watch(selectedGiftAmountProvider);
    final isAmountSelected = selectedAmount != null;

    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 10),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      width: double.infinity,
      height: height,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8),
            const CustomLabelTextFieldWidget(
                label: 'Recipient', placeholder: 'name'),
            const CustomLabelTextFieldWidget(
                label: 'Email', placeholder: 'email'),
            const CustomLabelTextFieldWidget(
                label: 'Message', placeholder: 'message', maxLine: 4),
            const SizedBox(height: 8),
            const _PaymentMethods(),
            const SizedBox(height: 32),
            GestureDetector(
              onTap: isAmountSelected ? () {} : null,
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: isAmountSelected ? Colors.black87 : Colors.grey,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                  child: AppText.medium(
                    'Continue',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PaymentMethods extends ConsumerWidget {
  const _PaymentMethods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paymentMethods = ref.watch(paymentMethodsProvider);
    final selectedPaymentMethod = ref.watch(selectedPaymentMethodProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText.medium(
              'Payment Method',
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
            TextButton(
              onPressed: () {},
              child: AppText.medium(
                'Add new +',
                color: ColorName.bgBlue,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
        paymentMethods.when(
            data: (paymentMethods) => ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: paymentMethods.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (context, index) {
                    final option = paymentMethods[index];
                    return _PaymentOption(
                      option: option,
                      selectedOption: selectedPaymentMethod,
                      onChange: (option) {
                        ref
                            .read(selectedPaymentMethodProvider.notifier)
                            .set(option);
                      },
                    );
                  },
                ),
            error: (e, s) => const SizedBox.shrink(),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )),
      ],
    );
  }
}

class _PaymentOption extends StatelessWidget {
  final PaymentOption option;
  final PaymentOption? selectedOption;
  final Function(PaymentOption?) onChange;

  const _PaymentOption(
      {required this.option,
      this.selectedOption,
      required this.onChange,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: Radio<PaymentOption>(
          value: option, groupValue: selectedOption, onChanged: onChange),
      title: Row(
        children: [
          SvgPicture.asset(option.iconUrl),
          const SizedBox(width: 8),
          AppText.medium(
            option.type == PaymentOptionType.creditCard
                ? option.number.toString()
                : option.name,
            fontWeight: FontWeight.normal,
          ),
        ],
      ),
    );
  }
}
