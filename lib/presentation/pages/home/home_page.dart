import 'package:flutter/material.dart';
import 'package:deeps_website/presentation/layout/adaptive.dart';
import 'package:deeps_website/presentation/pages/shared_sections/footer_section.dart';
import 'package:deeps_website/presentation/pages/home/sections/header_section/header_section.dart';
import 'package:deeps_website/presentation/pages/shared_sections/nav_section/nav_section_mobile.dart';
import 'package:deeps_website/presentation/pages/shared_sections/nav_section/nav_section_web.dart';
import 'package:deeps_website/presentation/pages/home/sections/news_section.dart';
import 'package:deeps_website/presentation/pages/shared_sections/nav_section/nav_mobile_app_drawer.dart';
import 'package:deeps_website/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  );

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels < 100) {
        _controller.reverse();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = heightOfScreen(context);
    double spacerHeight = screenHeight * 0.01;

    return Scaffold(
      key: _scaffoldKey,
      drawer: ResponsiveBuilder(
        refinedBreakpoints: const RefinedBreakpoints(),
        builder: (context, sizingInformation) {
          double screenWidth = sizingInformation.screenSize.width;
          if (screenWidth < const RefinedBreakpoints().desktopSmall) {
            return const AppDrawer();
          } else {
            return Container();
          }
        },
      ),
      body: Column(
        children: [
          ResponsiveBuilder(
            refinedBreakpoints: const RefinedBreakpoints(),
            builder: (context, sizingInformation) {
              double screenWidth = sizingInformation.screenSize.width;
              if (screenWidth < const RefinedBreakpoints().desktopSmall) {
                return NavSectionMobile(scaffoldKey: _scaffoldKey);
              } else {
                return NavSectionWeb();
              }
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Image.asset(ImagePath.heavyfighter),
                        ),
                      ),
                      Column(
                        children: [
                          const HeaderSection(),
                          SizedBox(height: spacerHeight),
                        ],
                      )
                    ],
                  ),
                  Stack(
                    children: [
                      Positioned(
                        top: assignWidth(context, 0.1),
                        left: -assignWidth(context, 0.05),
                        child: Image.asset(ImagePath.blobFemurAsh),
                      ),
                      Positioned(
                        right: -assignWidth(context, 0.5),
                        child: Image.asset(ImagePath.blobSmallBeanAsh),
                      ),
                      Column(
                        children: [
                          SizedBox(height: spacerHeight),
                          const NewsSection(),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: spacerHeight * 10),
                  Stack(
                    children: [
                      Positioned(
                        left: -assignWidth(context, 0.6),
                        child: Image.asset(ImagePath.blobAsh),
                      ),
                      const Column(
                        children: [
                          FooterSection(),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
