import 'package:flutter/material.dart';
import 'package:flutter_card_app_ui/gen/assets.gen.dart';
import 'package:flutter_card_app_ui/providers/all_cards_provider.dart';
import 'package:flutter_card_app_ui/providers/search_query_provider.dart';
import 'package:flutter_card_app_ui/providers/selected_card_category_provider.dart';
import 'package:flutter_card_app_ui/screens/card_detail_screen.dart';
import 'package:flutter_card_app_ui/utilities/app_text.dart';
import 'package:flutter_card_app_ui/utilities/constant.dart';
import 'package:flutter_card_app_ui/widgets/custom_chip_widget.dart';
import 'package:flutter_card_app_ui/widgets/custom_gift_card_widget.dart';
import 'package:flutter_card_app_ui/widgets/custom_navbar.dart';
import 'package:flutter_card_app_ui/widgets/custom_search_bar_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        bottomNavigationBar: const CustomNavBar(index: 0),
        body: Column(
          children: const [
            _HeaderSearch(),
            _CategoryFilterSection(),
            SizedBox(height: 8),
            Flexible(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: _BodyContent(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderSearch extends ConsumerWidget {
  const _HeaderSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(24.0).copyWith(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText.title('Gift Card'),
          const SizedBox(height: 12),
          CustomSearchBar(
            prefixIcon: Assets.icon.search.svg(),
            placeholder: 'search card..',
            onChange: ref.read(searchQueryProvider.notifier).onChange,
          ),
        ],
      ),
    );
  }
}

class _BodyContent extends ConsumerWidget {
  const _BodyContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final cards = ref.watch(allCardsProvider);

    return Padding(
        padding: const EdgeInsets.all(20).copyWith(top: 8),
        child: cards.when(
          data: (cards) => cards.isNotEmpty
              ? Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  direction: Axis.horizontal,
                  children: cards
                      .map((card) => GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((context) => CardDetailScreen(
                                          cardId: card.id,
                                        )),
                                  ));
                            },
                            child: CustomGiftCard(
                              model: card,
                              width: size.width / 2 - 40,
                            ),
                          ))
                      .toList(growable: false),
                )
              : Padding(
                  padding: EdgeInsets.only(top: size.height / 3),
                  child: Center(
                    child: AppText.medium('Card not found'),
                  ),
                ),
          error: (e, s) => Center(
            child: AppText.medium('failed to fetch card'),
          ),
          loading: () => Padding(
            padding: EdgeInsets.only(top: size.height / 3),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ));
  }
}

class _CategoryFilterSection extends ConsumerWidget {
  const _CategoryFilterSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(selectedCategoryProvider);
    return SizedBox(
      height: 30,
      child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
            const SizedBox(width: 24),
            ...CardCategory.values
                .map((category) => CustomChips(
                      label: category.capitalName(),
                      isSelected: category == selectedCategory,
                      onTap: () {
                        ref
                            .read(selectedCategoryProvider.notifier)
                            .setSelectedCategory(category);
                      },
                    ))
                .toList(growable: false),
            const SizedBox(width: 24),
          ]),
    );
  }
}
