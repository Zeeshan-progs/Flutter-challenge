import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_challenge/constants/colors.dart';
import 'package:flutter_challenge/constants/text_theme.dart';
import 'package:flutter_challenge/utils/device_utils.dart';
import 'package:flutter_challenge/utils/task_list.dart';
import 'package:flutter_challenge/utils/theme/theme_provider.dart';

class ListCard extends StatelessWidget {
  ListCard({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);
  DailyTask data;
  int index;
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, provider, child) => Container(
        height: 100,
        width: DeviceUtils.widget(context),
        decoration: BoxDecoration(
            color: provider.themeData.cardColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 1,
              color: provider.themeData.colorScheme.primary,
            )),
        margin: const EdgeInsets.symmetric(horizontal: 21),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, data.route);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (index.isEven) _dateCard(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data.title,
                        style: themeData.textTheme.headline6?.copyWith(
                          color: provider.themeData.colorScheme.secondary,
                        ),
                      ),
                      DeviceUtils.blankHeight(8),
                      Text(
                        data.description,
                        style: themeData.textTheme.button?.copyWith(
                          color: provider.themeData.colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (index.isOdd) _dateCardOdd(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dateCard() {
    return Consumer<ThemeProvider>(
      builder: (context, value, child) => Row(
        children: [
          Container(
            width: 5,
            decoration: BoxDecoration(
              color: value.themeData.colorScheme.primary,
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(8),
              ),
            ),
          ),
          Container(
            height: 100,
            width: 70,
            color: value.themeData.colorScheme.primary.withOpacity(0.3),
            child: Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: DateFormat('dd\n').format(data.cretedAt),
                    style: themeData.textTheme.bodyText1?.copyWith(
                      fontSize: 18,
                    ),
                    children: [
                      TextSpan(
                        text: DateFormat('EEE').format(data.cretedAt),
                        style: themeData.textTheme.headline6,
                      )
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _dateCardOdd() {
    return Consumer<ThemeProvider>(
      builder: (context, value, child) => Row(
        children: [
          Container(
            height: 100,
            width: 70,
            color: value.themeData.colorScheme.primary.withOpacity(0.3),
            child: Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: DateFormat('dd\n').format(data.cretedAt),
                    style: themeData.textTheme.bodyText1?.copyWith(
                      fontSize: 18,
                    ),
                    children: [
                      TextSpan(
                        text: DateFormat('EEE').format(data.cretedAt),
                        style: themeData.textTheme.headline6,
                      )
                    ]),
              ),
            ),
          ),
          Container(
            width: 5,
            decoration: BoxDecoration(
              color: value.themeData.colorScheme.primary,
              borderRadius: const BorderRadius.horizontal(
                right: Radius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
