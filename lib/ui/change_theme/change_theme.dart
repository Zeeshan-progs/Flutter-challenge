import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_challenge/constants/assets.dart';
import 'package:flutter_challenge/constants/colors.dart';
import 'package:flutter_challenge/utils/injector/project_injector.dart';
import 'package:flutter_challenge/utils/theme/shared_preference_helper.dart';
import 'package:flutter_challenge/utils/theme/theme_provider.dart';
import 'package:flutter_challenge/widget/light_app_bar.dart';

class ChangeTheme extends StatefulWidget {
  const ChangeTheme({super.key});

  @override
  State<ChangeTheme> createState() => _ChangeThemeState();
}

class _ChangeThemeState extends State<ChangeTheme> {
  final _preferenceHelper = getIt<SharedPreferenceHelper>();
  bool isdark = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      isdark = await getIt<SharedPreferenceHelper>().isdark;
    });
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
