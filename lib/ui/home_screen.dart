import 'package:flutter/material.dart';
import 'package:flutter_challenge/utils/device_utils.dart';
import 'package:flutter_challenge/utils/task_list.dart';
import 'package:flutter_challenge/widget/light_app_bar.dart';
import 'package:flutter_challenge/widget/list_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LightAppBar(title: 'Home screen'),
      body: SafeArea(
          child: Column(
        children: [
          DeviceUtils.blankHeight(26),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: ((context, index) {
              var data = tasks[index];
              return ListCard(
                data: data,
                index: index,
              );
            }),
            separatorBuilder: (ctx, index) => DeviceUtils.blankHeight(16),
            itemCount: tasks.length,
          ),
        ],
      )),
    );
  }
}
