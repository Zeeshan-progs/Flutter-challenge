import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'package:flutter_challenge/constants/colors.dart';
import 'package:flutter_challenge/utils/device_utils.dart';
import 'package:flutter_challenge/widget/light_app_bar.dart';

class ColorOpacityAnimation extends StatefulWidget {
  const ColorOpacityAnimation({super.key});

  @override
  State<ColorOpacityAnimation> createState() => _ColorOpacityAnimationState();
}

class _ColorOpacityAnimationState extends State<ColorOpacityAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final _scrollController = ScrollController(initialScrollOffset: 0.0);
  late Animation<Color?> _colorTween;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 0));

    _colorTween = ColorTween(begin: Colors.amber, end: Colors.cyanAccent)
        .animate(_controller);
    _scrollController.addListener(() {
      _controller.animateTo(_scrollController.position.pixels / 100);

      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: LightAppBar(
        title: 'Color opacity animation',
        appColor: AppColors.transParent,
      ),
      body: ListView(
        controller: _scrollController,
        children: [
          ///  Lets add some animation builder
          AnimatedBuilder(
              animation: _colorTween,
              builder: (context, animate) {
                log('anima ');
                return Container(
                  height: 600,
                  margin: const EdgeInsets.only(bottom: 20),
                  width: DeviceUtils.widget(context),
                  decoration: BoxDecoration(
                    color: _colorTween.value,
                  ),
                );
              }),
          ...List.generate(
            4,
            (index) => Container(
              height: 200,
              margin: const EdgeInsets.only(bottom: 20),
              width: DeviceUtils.widget(context),
              decoration: const BoxDecoration(
                color: Colors.lightGreenAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
