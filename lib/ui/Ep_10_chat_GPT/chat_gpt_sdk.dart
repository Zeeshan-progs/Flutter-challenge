import 'dart:async';
import 'dart:developer';

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart' as chat;
import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_challenge/constants/assets.dart';
import 'package:flutter_challenge/constants/colors.dart';
import 'package:flutter_challenge/constants/const.dart';
import 'package:flutter_challenge/constants/text_theme.dart';
import 'package:flutter_challenge/utils/device_utils.dart';
import 'package:flutter_challenge/utils/theme/theme_provider.dart';
import 'package:flutter_challenge/widget/light_app_bar.dart';

class ChatGPTScreen extends StatefulWidget {
  const ChatGPTScreen({super.key});

  @override
  State<ChatGPTScreen> createState() => _ChatGPTScreenState();
}

class _ChatGPTScreenState extends State<ChatGPTScreen> {
  final _textController = TextEditingController();

  bool loading = false;

  // chat [GPT] sdk initilization

  late chat.ChatGPT openAI;

  final List<Widget> _convo = [];
  void setConvo() {
    setState(() {
      loading = true;
    });
// create a request  ------

    final request = chat.CompleteReq(
      model: chat.kTranslateModelV3,
      prompt: _textController.text,
      max_tokens: 200,
    );

    // send your request to chat gpt ----

    openAI
        .onCompleteStream(request: request)
        .asBroadcastStream()
        .listen((event) {
      String? gptAnswer;
      if (event != null) {
// chat GPT store's response in [choices] ---

        if (event.choices.isNotEmpty == true) {
          gptAnswer = event.choices.last.text;
        }

        addData(gptAnswer);

        setState(() {});
      }

      setState(() {});
    });
  }

  void addData(String? gptAnswer) {
    _convo.add(_buildChat(_textController.text, gptAnswer ?? ''));
    _textController.clear();
    loading = false;
    setState(() {});
  }

  @override
  void initState() {
    // add your chat GPT token key
    openAI = chat.ChatGPT.instance.builder(chatGptKey);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeProvider().theme.colorScheme.background,
      appBar: LightAppBar(title: 'Chat GPT'),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _textFiled(context),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(
            10, 10, 10, kBottomNavigationBarHeight + kToolbarHeight),
        // add [Stream] to listen all queries directly

        child: ListView.separated(
            itemCount: _convo.length,
            separatorBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.only(top: 24.0),
                  child: Divider(),
                ),
            itemBuilder: (context, index) {
              var widget = _convo[index];
              return Column(
                children: [
                  widget,
                ],
              );
            }),
      )),
    );
  }

  Container _textFiled(BuildContext context) {
    return Container(
      height: 70,
      width: DeviceUtils.widget(context),
      margin: const EdgeInsets.fromLTRB(16, 8, 10, 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _textController,
              decoration: InputDecoration(
                  hintText: 'Ask questions....',
                  fillColor: ThemeProvider().theme.colorScheme.background,
                  filled: true),
            ),
          ),
          DeviceUtils.blankWidth(16),
          loading
              ? const SizedBox(
                  width: 25,
                  height: 25,
                  child: CircularProgressIndicator(),
                )
              : IconButton(
                  onPressed: setConvo,
                  icon: const Icon(
                    Icons.send,
                  ),
                ),
        ],
      ),
    );
  }

  Column _buildChat(String ques, gptAns) {
    return Column(
      children: [
        _userQuestion(ques),
        DeviceUtils.blankHeight(14),
        _gptAnswer(gptAns),
      ],
    );
  }

  Container _gptAnswer(String gptAns) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
      decoration: BoxDecoration(
        color: AppColors.day[2]?.withOpacity(0.1),
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          margin: const EdgeInsets.only(left: 16, top: 25),
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.day[2],
            image: const DecorationImage(
              image: AssetImage(
                Assets.gpt,
              ),
            ),
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 20, 16),
          child: Text(
            gptAns,
            style: themeData.textTheme.bodyText2?.copyWith(
              fontSize: 16,
              color: AppColors.white,
            ),
          ),
        )),
        TextButton.icon(
            onPressed: () async {
              await FlutterClipboard.copy(gptAns);
            },
            icon: const Icon(Icons.copy),
            label: const Text('Copy'))
      ]),
    );
  }

  Container _userQuestion(String userQuestion) {
    return Container(
      child: Row(children: [
        Container(
          margin: const EdgeInsets.only(left: 16),
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.day[1],
          ),
          child: const Icon(
            CupertinoIcons.person_alt,
            size: 30,
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 20, 16),
          child: Text(
            userQuestion,
            style: themeData.textTheme.bodyText2?.copyWith(
              fontSize: 16,
              color: AppColors.white,
            ),
          ),
        ))
      ]),
    );
  }
}
