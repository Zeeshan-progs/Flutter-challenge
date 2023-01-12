import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_challenge/constants/assets.dart';
import 'package:flutter_challenge/constants/colors.dart';
import 'package:flutter_challenge/constants/text_theme.dart';
import 'package:flutter_challenge/utils/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class ScrollToZoomImage extends StatefulWidget {
  const ScrollToZoomImage({super.key});

  @override
  State<ScrollToZoomImage> createState() => _ScrollToZoomImageState();
}

class _ScrollToZoomImageState extends State<ScrollToZoomImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          top: false,
          child: Consumer<ThemeProvider>(
            builder: (context, value, child) {
              return CustomScrollView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    stretch: true,
                    pinned: true,
                    iconTheme: const IconThemeData(color: AppColors.white),
                    toolbarHeight: kToolbarHeight,
                    expandedHeight: 350,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text(
                        'Scroll to zoom',
                        style: themeData.textTheme.bodyText1?.copyWith(
                          fontSize: 24,
                          color: AppColors.white,
                        ),
                      ),
                      expandedTitleScale: 1.3,
                      centerTitle: true,
                      collapseMode: CollapseMode.parallax,
                      stretchModes: const [
                        /** Add [zoom] if you want your image to get zoom while [scroll] */
                        StretchMode.zoomBackground,

                        /** Add [blur] if you want your image to get blurry while [scroll] */
                        // StretchMode.blurBackground,

                        /** Add [fadeTile] if you want your title to get fade while [scroll] */
                        // StretchMode.fadeTitle,
                      ],
                      background: Image.network(
                        Assets.networkImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate.fixed(
                      [
                        ...List.generate(
                          100,
                          (index) => Text('Dummy data $index'),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          )),
    );
  }
}
