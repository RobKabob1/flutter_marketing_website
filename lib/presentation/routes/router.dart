import 'package:deeps_website/presentation/pages/market_page.dart';
import 'package:deeps_website/presentation/pages/news_page.dart';
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
          path: 'Home',
          builder: (BuildContext context, GoRouterState state) {
            return const HomePage();
          },
        ),
        GoRoute(
          path: 'News',
          builder: (BuildContext context, GoRouterState state) {
            return const NewsPage();
          },
        ),
        GoRoute(
          path: 'Wiki',
          builder: (BuildContext context, GoRouterState state) {
            return const WikiPage();
          },
        ),
        GoRoute(
          path: 'leaderboards',
          builder: (BuildContext context, GoRouterState state) {
            return const WikiPage();
          },
        ),
        GoRoute(
          path: 'stellarmap',
          builder: (BuildContext context, GoRouterState state) {
            return const WikiPage();
          },
        ),
        GoRoute(
          path: 'market',
          builder: (BuildContext context, GoRouterState state) {
            return const MarketPage();
          },
        ),
      ],
    ),
  ],
);
