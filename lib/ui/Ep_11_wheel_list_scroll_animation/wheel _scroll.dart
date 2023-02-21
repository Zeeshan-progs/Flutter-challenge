import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_challenge/utils/device_utils.dart';
import 'package:flutter_challenge/widget/light_app_bar.dart';

class WheelScroll extends StatefulWidget {
  const WheelScroll({super.key});

  @override
  State<WheelScroll> createState() => _WheelScrollState();
}

class _WheelScrollState extends State<WheelScroll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LightAppBar(title: 'Wheel Scroll'),
      body: SafeArea(
        child: ListWheelScrollView(
          itemExtent: 100,
          children: [
            ...List.generate(
              100,
              (index) => Container(
                height: 100,
                width: DeviceUtils.widget(context),
                color: Color.fromRGBO(Random().nextInt(255),
                    Random().nextInt(255), Random().nextInt(255), 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




