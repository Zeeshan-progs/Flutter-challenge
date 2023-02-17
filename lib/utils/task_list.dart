import 'package:flutter_challenge/utils/routes.dart';

class DailyTask {
  String title;
  String description;
  DateTime cretedAt;
  String route;

  DailyTask({
    required this.description,
    required this.title,
    required this.cretedAt,
    required this.route,
  });
}

List<DailyTask> tasks = [
  DailyTask(
    description: 'Animated align',
    title: 'Ep: 1',
    cretedAt: DateTime(2022, 10, 8),
    route: Routes.animatedAlign,
  ),
  DailyTask(
    description: 'Dragabble',
    title: 'Ep: 2',
    cretedAt: DateTime(2022, 10, 16),
    route: Routes.draggableScreen,
  ),
  DailyTask(
    description: 'Text to speech',
    title: 'Ep: 3',
    cretedAt: DateTime(2022, 10, 30),
    route: Routes.textToSpeech,
  ),
  DailyTask(
    description: 'Change theme',
    title: 'Ep: 4',
    cretedAt: DateTime(2022, 11, 7),
    route: Routes.changeTheme,
  ),
  DailyTask(
    description: 'Tag in image',
    title: 'Ep: 5',
    cretedAt: DateTime(2022, 11, 26),
    route: Routes.tagInImage,
  ),
  DailyTask(
    description: 'Scroll to zoom image',
    title: 'Ep: 9',
    cretedAt: DateTime(2023, 01, 12),
    route: Routes.scrollToZoomImage,
  ),
  DailyTask(
    description: 'Chat GPT SDK',
    title: 'Ep: 10',
    cretedAt: DateTime(2023, 01, 26),
    route: Routes.chatGPT,
  ),
];
