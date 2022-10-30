import 'package:flutter/material.dart';

import 'package:flutter_challenge/constants/colors.dart';
import 'package:flutter_challenge/constants/text_theme.dart';

class LightAppBar extends StatelessWidget implements PreferredSizeWidget {
  LightAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);
  var title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: AppColors.white,
        size: 22,

      ),
      
      title: title is String
          ? Text(
              title,
              style: themeData.textTheme.headline6?.copyWith(
                color: AppColors.white,
              ),
            )
          : title is Widget
              ? title
              : Container(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
