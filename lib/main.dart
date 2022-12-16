import 'package:flutter/material.dart';
import 'package:flutter_card_app_ui/gen/colors.gen.dart';
import 'package:flutter_card_app_ui/gen/fonts.gen.dart';
import 'package:flutter_card_app_ui/screens/home_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: CardApp()));
}

class CardApp extends StatelessWidget {
  const CardApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Card App UI',
      theme: ThemeData(
        fontFamily: FontFamily.merriweather,
        primarySwatch: ColorName.primarySwatch,
      ),
      home: const HomeScreen(),
    );
  }
}
