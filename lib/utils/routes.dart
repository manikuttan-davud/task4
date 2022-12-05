import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:task_four/screens/empty_screen.dart';
import 'package:task_four/screens/notification_screen.dart';

const String initialRoute = NotificationScreen.route;

List<GetPage<dynamic>>? appRoutes() => [
      GetPage(
        name: NotificationScreen.route,
        page: () => const NotificationScreen(),
      ),
      GetPage(
        name: EmptyScreen.route,
        page: () => const EmptyScreen(),
      ),
    ];
