import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../gen/colors.gen.dart';
import '../models/card_model.dart';
import '../providers/all_cards_provider.dart';
import '../providers/search_query_provider.dart';
import '../providers/selected_card_category_provider.dart';
import '../providers/selected_card_provider.dart';
import '../utilities/app_text.dart';
import '../utilities/constant.dart';
import '../widgets/custom_chip_widget.dart';
import '../widgets/custom_gift_card.dart';
import '../widgets/custom_navbar.dart';
import 'card_detail_select_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: AppText.title('Gift Card'),
        ),
      ),
      bottomNavigationBar: const CustomNavBar(index: 0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: const [
            SizedBox(height: 10.0),
            _SearchBar(),
            SizedBox(height: 20.0),
            _Filters(),
            SizedBox(height: 20.0),
            _CardList(),
          ],
        ),
      ),
    );
  }
}

class _SearchBar extends ConsumerWidget {
  const _SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Flexible(
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorName.lightGrey,
          hintText: 'Search card',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: ref.read(searchQueryProvider.notifier).onChange,
      ),
    );
  }
}

class _Filters extends ConsumerWidget {
  const _Filters({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(selectedCategoryProvider);
    return SizedBox(
      height: 30,
      child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
            ...CardCategory.values
                .map(
                  (category) => CustomChips(
                    label: category.capitalName(),
                    isSelected: category == selectedCategory,
                    onTap: () {
                      ref
                          .read(selectedCategoryProvider.notifier)
                          .setSelectedCategory(category);
                    },
                  ),
                )
                .toList(growable: false),
            const SizedBox(width: 24),
          ]),
    );
  }
}

class _CardList extends ConsumerWidget {
  const _CardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final cards = ref.watch(allCardsProvider);

    ref.watch(selectedCardIdProvider);

    return cards.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (cards) => SizedBox(
        height: size.height * 0.60,
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            mainAxisSpacing: 10,
          ),
          itemCount: cards.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                ref
                    .read(selectedCardIdProvider.notifier)
                    .setSelectedCardId(cards[index].id);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) {
                      return CardDetailScreen(
                        cardId: cards[index].id,
                      );
                    }),
                  ),
                );
              },
              child: CustomGiftCard(
                model: cards[index],
                width: size.width * 0.425,
              ),
            );
          },
        ),
      ),
      error: (e, s) => Center(child: AppText.medium('Failed to fetch card')),
    );
  }
}
