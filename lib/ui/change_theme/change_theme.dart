import 'package:flutter/material.dart';
import 'package:flutter_challenge/constants/assets.dart';
import 'package:flutter_challenge/utils/theme/theme_provider.dart';
import 'package:flutter_challenge/widget/light_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';

class ChangeTheme extends StatefulWidget {
  const ChangeTheme({super.key});

  @override
  State<ChangeTheme> createState() => _ChangeThemeState();
}

class _ChangeThemeState extends State<ChangeTheme> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> vibrateOnChange() async {
    await Vibration.vibrate(
      // lets add some duration
      duration: 1000,
      pattern: [10, 60, 90, 50, 20, 0],

      amplitude: 20,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LightAppBar(title: 'Change theme'),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: Consumer<ThemeProvider>(
              builder: (context, provider, child) => Column(
                children: [
                  SizedBox(
                    height: 100,
                    width: 200,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Switch(
                          value: provider.isDark,
                          inactiveThumbImage: const AssetImage(Assets.dark),
                          activeThumbImage: const AssetImage(Assets.light),
                          onChanged: (value) async {
                            provider.toggle(context);
                            await vibrateOnChange();
                          }),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
