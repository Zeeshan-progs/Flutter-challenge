import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_challenge/constants/text_theme.dart';
import 'package:flutter_challenge/utils/device_utils.dart';
import 'package:flutter_challenge/widget/light_app_bar.dart';

enum Align {
  topLeft,
  topRight,
  topCenter,
  bottomCenter,
  bottomLeft,
  bottomRight,
  center
}

class AnimatedAlignWidget extends StatefulWidget {
  const AnimatedAlignWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedAlignWidget> createState() => _AnimatedAlignWidgetState();
}

class _AnimatedAlignWidgetState extends State<AnimatedAlignWidget> {
  Alignment getAlign(Align val) {
    switch (val) {
      case Align.bottomLeft:
        return Alignment.bottomLeft;

      case Align.bottomRight:
        return Alignment.bottomRight;
      case Align.topLeft:
        return Alignment.topLeft;
      case Align.topRight:
        return Alignment.topRight;
      case Align.center:
        return Alignment.center;
      case Align.topCenter:
        return Alignment.topCenter;
      case Align.bottomCenter:
        return Alignment.bottomCenter;
      default:
        return Alignment.center;
    }
  }

  int _getRandom() {
    return Random().nextInt(Align.values.length);
  }

  Alignment selectedAlignment = Alignment.center;

  void onTap() {
    setState(() {
      selectedAlignment = getAlign(Align.values[_getRandom()]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LightAppBar(
        title: 'Animated align',
      ),
      body: SafeArea(
          child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: DeviceUtils.height(context),
          width: DeviceUtils.widget(context),
          child: AnimatedAlign(
            alignment: selectedAlignment,
            duration: const Duration(
              milliseconds: 800,
            ),
            curve: Curves.bounceInOut,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Code with nix'.toUpperCase(),
                style: themeData.textTheme.headline6,
              ),
            ),
          ),
        ),
      )),
    );
  }
}
