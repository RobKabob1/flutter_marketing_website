import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:deeps_website/presentation/pages/home/home_page.dart';

final GoRouter deepsWebsiteRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
  ],
);
