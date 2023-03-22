import 'package:flutter/material.dart';
import 'package:flutter_challenge/constants/colors.dart';
import 'package:flutter_challenge/widget/light_app_bar.dart';

class SoundWaveAnimation extends StatefulWidget {
  const SoundWaveAnimation({super.key});

  @override
  State<SoundWaveAnimation> createState() => _SoundWaveAnimationState();
}

class _SoundWaveAnimationState extends State<SoundWaveAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    _controller.addListener(() {
      if (currentIndex == 6) {
        currentIndex = 0;
      } else {
        currentIndex++;
      }
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
      appBar: LightAppBar(title: 'Sound wave animation'),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(6, (index) {
                int currentAnimation = (_controller.value * 6).floor();

                return AnimatedBuilder(
                    animation: _controller.view,
                    builder: (context, animation) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInToLinear,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        constraints: BoxConstraints(
                          minHeight: currentAnimation == index ? 45 : 20,
                          minWidth: 8,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.black,
                          borderRadius: BorderRadius.circular(35),
                        ),
                      );
                    });
              }),
            ),
          ],
        ),
      ),
    );
  }
}
