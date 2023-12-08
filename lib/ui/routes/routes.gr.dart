// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'routes.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddMedicineRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddMedicinePage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    MarkMedicineSettingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MarkMedicineSettingPage(),
      );
    },
    MissedMedicineRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MissedMedicinePage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsPage(),
      );
    },
  };
}

/// generated route for
/// [AddMedicinePage]
class AddMedicineRoute extends PageRouteInfo<void> {
  const AddMedicineRoute({List<PageRouteInfo>? children})
      : super(
          AddMedicineRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddMedicineRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MarkMedicineSettingPage]
class MarkMedicineSettingRoute extends PageRouteInfo<void> {
  const MarkMedicineSettingRoute({List<PageRouteInfo>? children})
      : super(
          MarkMedicineSettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'MarkMedicineSettingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MissedMedicinePage]
class MissedMedicineRoute extends PageRouteInfo<void> {
  const MissedMedicineRoute({List<PageRouteInfo>? children})
      : super(
          MissedMedicineRoute.name,
          initialChildren: children,
        );

  static const String name = 'MissedMedicineRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
