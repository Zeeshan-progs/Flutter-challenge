import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:widget_challenge/constants/colors.dart';
import 'package:widget_challenge/constants/text_theme.dart';
import 'package:widget_challenge/utils/device_utils.dart';
import 'package:widget_challenge/utils/task_list.dart';

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
    return Container(
      height: 100,
      width: DeviceUtils.widget(context),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: .5,
          color: AppColors.day[1]!,
        ),
      ),
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
                      style: themeData.textTheme.headline6,
                    ),
                    DeviceUtils.blankHeight(8),
                    Text(
                      data.description,
                      style: themeData.textTheme.button,
                    ),
                  ],
                ),
              ),
            ),
            if (index.isOdd) _dateCardOdd(),
          ],
        ),
      ),
    );
  }

  Row _dateCard() {
    return Row(
      children: [
        Container(
          width: 5,
          decoration: BoxDecoration(
            color: AppColors.day[1],
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(8),
            ),
          ),
        ),
        Container(
          height: 100,
          width: 70,
          color: AppColors.day[1]?.withOpacity(0.3),
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
    );
  }

  Row _dateCardOdd() {
    return Row(
      children: [
        Container(
          height: 100,
          width: 70,
          color: AppColors.day[1]?.withOpacity(0.3),
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
            color: AppColors.day[1],
            borderRadius: const BorderRadius.horizontal(
              right: Radius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
