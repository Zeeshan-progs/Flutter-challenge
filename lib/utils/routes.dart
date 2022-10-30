import 'package:flutter/material.dart';
import 'package:flutter_challenge/ui/Alignment_align/animated_align_screen.dart';
import 'package:flutter_challenge/ui/change_theme/change_theme.dart';
import 'package:flutter_challenge/ui/dragabble/dragabble.dart';
import 'package:flutter_challenge/ui/text_to_speech/text_to_speech.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> route = {
    ep1: (context) => const AnimatedAlignWidget(),
    ep2: (context) => const DraggableScreen(),
    ep3:(context) =>const TextToSpeech() ,
    changeTheme:(context) => const ChangeTheme(), 
  };

  static String ep1 = '/animated_align_screen';
  static String ep2 = '/dragabble';
  static String ep3 = '/text_to_speech';
  static String changeTheme = '/change_theme';

  
}
