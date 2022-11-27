import 'package:flutter/material.dart';
import 'package:flutter_challenge/constants/colors.dart';
import 'package:flutter_challenge/constants/text_theme.dart';
import 'package:flutter_challenge/ui/tag_in_image/image_tag_model.dart';
import 'package:flutter_challenge/ui/tag_in_image/image_tag_provider.dart';
import 'package:flutter_challenge/utils/device_utils.dart';
import 'package:flutter_challenge/widget/light_app_bar.dart';
import 'package:provider/provider.dart';

class TagInImage extends StatefulWidget {
  const TagInImage({super.key});

  @override
  State<TagInImage> createState() => _TagInImageState();
}

class _TagInImageState extends State<TagInImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LightAppBar(title: "Tag in image"),
      body: SafeArea(
        child: Center(
          child: AspectRatio(
            aspectRatio: 1,
            child: ChangeNotifierProvider(
                create: (context) => ImageTagProvider(),
                builder: (context, child) {
                  return Consumer<ImageTagProvider>(
                    builder: (context, provider, child) {
                      return Stack(
                        children: [
                          Positioned.fill(
                            child: GestureDetector(
                              onTapDown: (details) {
                                final textController = TextEditingController();

                                _addName(
                                  context,
                                  textController,
                                  provider,
                                  details,
                                );
                              },
                              child: Image.network(
                                "https://images.unsplash.com/photo-1669434113533-e39391413a18?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=988&q=80",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          ...List.generate(
                            provider.imagetags.length,
                            (index) => Transform.translate(
                              offset: provider.imagetags[index].offset,
                              child: Container(
                                height: 30,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 6),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      provider.imagetags[index].name,
                                    ),
                                    DeviceUtils.blankWidth(16),
                                    InkWell(
                                      onTap: () {
                                        provider.removeTag(index);
                                      },
                                      child: const Icon(
                                        Icons.close_rounded,
                                        color: AppColors.white,
                                        size: 15,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }),
          ),
        ),
      ),
    );
  }

  Future<dynamic> _addName(
    BuildContext context,
    TextEditingController textController,
    ImageTagProvider provider,
    TapDownDetails details,
  ) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Add user name",
          style: themeData.textTheme.headline4,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: textController,
              decoration: const InputDecoration(
                labelText: 'Enter name',
              ),
            ),
            DeviceUtils.blankHeight(16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
              ),
              onPressed: () {
                if (textController.text.isNotEmpty) {
                  Navigator.pop(context);
                  provider.setImageTags(
                    ImageTagModel(textController.text, details.localPosition),
                  );
                }
              },
              child: Text(
                'Save',
                style: themeData.textTheme.bodyText2?.copyWith(
                  color: AppColors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
