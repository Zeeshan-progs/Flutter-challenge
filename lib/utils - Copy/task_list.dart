import 'package:widget_challenge/utils/routes.dart';

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
    route: Routes.ep1,
  ),
  DailyTask(
    description: 'Dragabble',
    title: 'Ep: 2',
    cretedAt: DateTime(2022, 10, 16),
    route: Routes.ep2,
  ),
];
