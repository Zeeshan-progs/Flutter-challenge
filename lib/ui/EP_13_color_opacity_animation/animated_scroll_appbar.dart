import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'package:flutter_challenge/constants/assets.dart';
import 'package:flutter_challenge/constants/colors.dart';
import 'package:flutter_challenge/utils/device_utils.dart';

class AppBarAnimation extends StatefulWidget {
  const AppBarAnimation({super.key});

  @override
  State<AppBarAnimation> createState() => _AppBarAnimationState();
}

class _AppBarAnimationState extends State<AppBarAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final _scrollController = ScrollController(initialScrollOffset: 0.0);
  late Animation<Color?> _appbarBGColor;
  late Animation<Color?> _leadingIconColor;
  late Animation<Color?> _leadingColor;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.transParent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 0),
    );

    _appbarBGColor = ColorTween(
      begin: AppColors.transParent,
      end: AppColors.primaryColor,
    ).animate(_controller);

    _leadingColor = ColorTween(
      begin: AppColors.primaryColor,
      end: AppColors.white,
    ).animate(_controller);

    _leadingIconColor = ColorTween(
      end: AppColors.primaryColor,
      begin: AppColors.white,
    ).animate(_controller);

    _scrollController.addListener(() {
      _controller.animateTo(_scrollController.position.pixels / 260);
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AnimatedBuilder(
            animation: _controller,
            builder: (context, animate) {
              return AppBar(
                backgroundColor: _appbarBGColor.value,
                elevation: 0,
                shadowColor: AppColors.transParent,
                leading: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Chip(
                    backgroundColor: _leadingColor.value,
                    labelPadding: const EdgeInsets.all(3),
                    label: Icon(
                      Icons.arrow_back,
                      color: _leadingIconColor.value,
                    ),
                  ),
                ),
              );
            }),
      ),
      body: SafeArea(
        top: false,
        child: ListView(
          controller: _scrollController,
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 400,
              width: DeviceUtils.widget(context),
              color: AppColors.white,
              child: Stack(children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    Assets.bg,
                    height: 350,
                    fit: BoxFit.cover,
                    width: DeviceUtils.widget(context),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 20,
                  child: Container(
                    height: 150,
                    width: DeviceUtils.widget(context) * 0.9,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.gray.withOpacity(0.3),
                          offset: const Offset(0, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
            ...List.generate(
              6,
              (index) => Container(
                height: 400,
                margin: const EdgeInsets.only(bottom: 10),
                width: DeviceUtils.widget(context),
                color: Color.fromRGBO(
                  10,
                  50,
                  200,
                  1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
