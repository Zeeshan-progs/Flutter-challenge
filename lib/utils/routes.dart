import 'package:flutter/material.dart';
import 'package:flutter_challenge/ui/Ep_1_Alignment_align/animated_align_screen.dart';
import 'package:flutter_challenge/ui/Ep_4_change_theme/change_theme.dart';
import 'package:flutter_challenge/ui/Ep_2_dragabble/dragabble.dart';
import 'package:flutter_challenge/ui/Ep_5_tag_in_image/image_tag.dart';
import 'package:flutter_challenge/ui/Ep_3_text_to_speech/text_to_speech.dart';
import 'package:flutter_challenge/ui/Ep_9_zoom_image_in_appbar/zoom_image_in_appbar.dart';

class Routes {
  static Map<String, Widget Function(BuildContext context)> route = {
    animatedAlign: (context) => const AnimatedAlignWidget(),
    draggableScreen: (context) => const DraggableScreen(),
    textToSpeech: (context) => const TextToSpeech(),
    changeTheme: (context) => const ChangeTheme(),
    tagInImage: (context) => const TagInImage(),
    scrollToZoomImage:(context) => const ScrollToZoomImage(), 
  };

  static String animatedAlign = '/animated_align_screen';
  static String draggableScreen = '/dragabble';
  static String textToSpeech = '/text_to_speech';
  static String changeTheme = '/change_theme';
  static String tagInImage = '/tag_in_image';

  static String scrollToZoomImage = '/Scroll to zoom image';
}
