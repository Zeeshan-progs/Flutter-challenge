import 'package:flutter/material.dart';
import 'package:flutter_challenge/ui/Alignment_align/animated_align_screen.dart';
import 'package:flutter_challenge/ui/change_theme/change_theme.dart';
import 'package:flutter_challenge/ui/dragabble/dragabble.dart';
import 'package:flutter_challenge/ui/tag_in_image/image_tag.dart';
import 'package:flutter_challenge/ui/text_to_speech/text_to_speech.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> route = {
    animatedAlign: (context) => const AnimatedAlignWidget(),
    draggableScreen: (context) => const DraggableScreen(),
    textToSpeech:(context) =>const TextToSpeech() ,
    changeTheme:(context) => const ChangeTheme(), 
    tagInImage:(context) => const TagInImage(), 
  };

  static String animatedAlign = '/animated_align_screen';
  static String draggableScreen = '/dragabble';
  static String textToSpeech = '/text_to_speech';
  static String changeTheme = '/change_theme';
  static String tagInImage = '/tag_in_image';


  
}
