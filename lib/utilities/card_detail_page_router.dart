import 'package:flutter/material.dart';
import 'package:flutter_card_app_ui/models/page_argument_model.dart';
import 'package:flutter_card_app_ui/screens/card_detail_input_data_page.dart';
import 'package:flutter_card_app_ui/screens/card_detail_select_page.dart';

class CardDetailPageRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case CardDetailSelectPage.route:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (BuildContext context) {
              return const CardDetailSelectPage();
            });

      case CardDetailInputPage.route:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (BuildContext context) {
              final args =
                  routeSettings.arguments as CardDetailInputPageArgument;

              return CardDetailInputPage(
                model: args.model,
                giftAmount: args.giftAmount,
              );
            });

      default:
        return null;
    }
  }
}
