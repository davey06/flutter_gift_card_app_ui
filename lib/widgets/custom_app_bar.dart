import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import '../utilities/app_text.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: AppText.medium(
        'The Card',
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
              color: Colors.black38,
              blurRadius: 5.0,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: IconButton(
            icon: Assets.icon.back.svg(),
            onPressed: () => Navigator.pop(context)),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
