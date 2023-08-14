import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:deeps_website/presentation/pages/home/home_page.dart';
import 'package:deeps_website/presentation/pages/wiki_page.dart';

final GoRouter deepsWebsiteRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'News',
          builder: (BuildContext context, GoRouterState state) {
            return const WikiPage(title: 'News');
          },
        ),
        GoRoute(
          path: 'Wiki',
          builder: (BuildContext context, GoRouterState state) {
            return const WikiPage(title: 'Wiki');
          },
        ),
        GoRoute(
          path: 'leaderboards',
          builder: (BuildContext context, GoRouterState state) {
            return const WikiPage(title: 'Leaderboards');
          },
        ),
        GoRoute(
          path: 'stellarmap',
          builder: (BuildContext context, GoRouterState state) {
            return const WikiPage(title: 'Stellar Map');
          },
        ),
        GoRoute(
          path: 'market',
          builder: (BuildContext context, GoRouterState state) {
            return const WikiPage(title: 'Market');
          },
        ),
      ],
    ),
  ],
);
