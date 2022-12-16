import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../gen/assets.gen.dart';
import '../gen/colors.gen.dart';
import '../screens/home_screen.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavBarIcon(
              iconPath: Assets.icon.home.path,
              isSelected: index == 0,
              onTap: index != 0
                  ? () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const HomeScreen()),
                        ),
                      );
                    }
                  : null,
            ),
            _NavBarIcon(
              iconPath: Assets.icon.discover.path,
            ),
            _NavBarIcon(
              iconPath: Assets.icon.gift.path,
            ),
            _NavBarIcon(
              iconPath: Assets.icon.card.path,
            ),
          ],
        ),
      ),
    );
  }
}

class _NavBarIcon extends StatelessWidget {
  const _NavBarIcon({
    Key? key,
    required this.iconPath,
    this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  final String iconPath;
  final Function()? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? ColorName.primaryColor : ColorName.disabledGrey;
    return InkWell(
      onTap: onTap,
      child: Center(child: SvgPicture.asset(iconPath, color: color)),
    );
  }
}
