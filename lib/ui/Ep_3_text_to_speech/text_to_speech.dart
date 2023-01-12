import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_challenge/constants/assets.dart';
import 'package:flutter_challenge/constants/colors.dart';
import 'package:flutter_challenge/widget/light_app_bar.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeech extends StatefulWidget {
  const TextToSpeech({super.key});

  @override
  State<TextToSpeech> createState() => _TextToSpeechState();
}

class _TextToSpeechState extends State<TextToSpeech> {
  final textController = TextEditingController();

  final focusNode = FocusNode();
  FlutterTts flutterTts = FlutterTts();
  bool isPlaying = false;
  @override
  void initState() {
    flutterTts.getDefaultEngine;
    Future.delayed(Duration.zero, () async {
      if (Platform.isIOS) {
        await flutterTts.setSharedInstance(true);
      }
    });
    super.initState();
  }

  void doToggle() => setState(() {
        isPlaying = !isPlaying;
      });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LightAppBar(title: 'Text to speech'),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: GestureDetector(
          onTap: () {
            focusNode.unfocus();
          },
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Visibility(
                    visible: isPlaying,
                    child: Image.asset(Assets.sound),
                  ),
                ),
                TextField(
                  controller: textController,
                  focusNode: focusNode,
                  maxLines: 6,
                  decoration: InputDecoration(
                    hintText: 'Type to speek',
                    suffixIcon: SizedBox(
                      height: 25,
                      width: 25,
                      child: InkWell(
                        onTap: () async {
                          if (textController.text.isNotEmpty) {
                            doToggle();
                            await flutterTts.speak(textController.text);
                            flutterTts.setCompletionHandler(doToggle);
                          }
                        },
                        child: const Center(
                          child: Icon(
                           Icons.play_arrow_rounded,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
