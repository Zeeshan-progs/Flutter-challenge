import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_challenge/constants/assets.dart';
import 'package:flutter_challenge/constants/colors.dart';
import 'package:flutter_challenge/constants/text_theme.dart';
import 'package:flutter_challenge/widget/light_app_bar.dart';

class DraggableScreen extends StatefulWidget {
  const DraggableScreen({Key? key}) : super(key: key);

  @override
  State<DraggableScreen> createState() => _DraggableScreenState();
}

class _DraggableScreenState extends State<DraggableScreen> {
  Offset _drag(Draggable draggable, BuildContext contex, Offset offset) {
    return const Offset(20, 40);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LightAppBar(title: 'Dragabble'),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Draggable(
                // use axis to fix your drag in single axis

                affinity: Axis.vertical,
                // this show you the initial position of draggable widget
                feedbackOffset: const Offset(1, 1),
                maxSimultaneousDrags: 1,
                onDragCompleted: () {
                  log('drag is done');
                },
                data: 10,
                dragAnchorStrategy: _drag,
                childWhenDragging: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryColor),
                  ),
                  child: Center(
                    child: Text(
                      'Leave me now',
                      style: themeData.textTheme.bodyText2?.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
                feedback: Center(
                  child: Image.asset(
                    Assets.appIcon,
                    height: 100,
                    width: 100,
                  ),
                ),
                child: Container(
                  height: 100,
                  width: 100,
                  color: AppColors.gray,
                  child: Center(
                    child: Text(
                      'Drag me ',
                      style: themeData.textTheme.bodyText2?.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
