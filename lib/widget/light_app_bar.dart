import 'package:flutter/material.dart';

import 'package:flutter_challenge/constants/colors.dart';
import 'package:flutter_challenge/constants/text_theme.dart';

class LightAppBar extends StatelessWidget implements PreferredSizeWidget {
  LightAppBar({
    Key? key,
    required this.title,
    this.appColor,
  }) : super(key: key);
  var title;
  Color? appColor;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: appColor,
      iconTheme: IconThemeData(
        color: appColor == null ? AppColors.white : AppColors.black,
        size: 22,
      ),
      title: title is String
          ? Text(
              title,
              style: themeData.textTheme.headline6?.copyWith(
                color: appColor == null ? AppColors.white : AppColors.black,
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
