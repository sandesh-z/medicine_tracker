import 'package:auto_route/auto_route.dart';
import 'package:medicine_tracker/ui/pages/add_medicine_page.dart';
import 'package:medicine_tracker/ui/pages/home/home_page.dart';
import 'package:medicine_tracker/ui/pages/missed_medicines/missed_medicines_page.dart';

part 'routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: AddMedicineRoute.page),
        AutoRoute(page: MissedMedicineRoute.page)
      ];
}
