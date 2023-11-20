import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medicine_tracker/home_page.dart';
import 'package:medicine_tracker/ui/pages/add_medicine_page.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'add',
          builder: (BuildContext context, GoRouterState state) {
            return const AddMedicinePage();
          },
        ),
      ],
    ),
  ],
);
