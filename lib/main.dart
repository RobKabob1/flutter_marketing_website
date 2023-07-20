import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:deeps_website/presentation/routes/router.dart';
import 'package:deeps_website/values/values.dart';
import 'app_theme.dart';

void main() {
  runApp(const DeepsSite());
}

class DeepsSite extends StatelessWidget {
  const DeepsSite({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: MaterialApp.router(
        routerConfig: deepsWebsiteRouter,
        title: StringConst.appName,
        theme: AppTheme.lightThemeData,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
