import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:deeps_website/presentation/layout/adaptive.dart';
import 'package:deeps_website/presentation/pages/home/sections/about_me_section.dart';
import 'package:deeps_website/presentation/pages/home/sections/awards_section.dart';
import 'package:deeps_website/presentation/pages/home/sections/footer_section.dart';
import 'package:deeps_website/presentation/pages/home/sections/header_section/header_section.dart';
import 'package:deeps_website/presentation/pages/home/sections/nav_section/nav_section_mobile.dart';
import 'package:deeps_website/presentation/pages/home/sections/nav_section/nav_section_web.dart';
import 'package:deeps_website/presentation/pages/home/sections/projects_section.dart';
import 'package:deeps_website/presentation/pages/home/sections/skills_section.dart';
import 'package:deeps_website/presentation/pages/home/sections/statistics_section.dart';
import 'package:deeps_website/presentation/widgets/app_drawer.dart';
import 'package:deeps_website/presentation/widgets/nav_item.dart';
import 'package:deeps_website/utils/functions.dart';
import 'package:deeps_website/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:visibility_detector/visibility_detector.dart';

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
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOut,
  );
  // bool isFabVisible = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final ScrollController _scrollController = ScrollController();

  final List<NavItemData> navItems = [
    NavItemData(name: StringConst.home, key: GlobalKey(), isSelected: true),
    NavItemData(name: StringConst.wiki, key: GlobalKey()),
    NavItemData(name: StringConst.leaderboards, key: GlobalKey()),
    NavItemData(name: StringConst.stellarMap, key: GlobalKey()),
    NavItemData(name: StringConst.market, key: GlobalKey()),
  ];

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
    double spacerHeight = screenHeight * 0.10;

    return Scaffold(
      key: _scaffoldKey,
      drawer: ResponsiveBuilder(
        refinedBreakpoints: const RefinedBreakpoints(),
        builder: (context, sizingInformation) {
          double screenWidth = sizingInformation.screenSize.width;
          if (screenWidth < const RefinedBreakpoints().desktopSmall) {
            return AppDrawer(
              menuList: navItems,
            );
          } else {
            return Container();
          }
        },
      ),
      floatingActionButton: ScaleTransition(
        scale: _animation,
        child: FloatingActionButton(
          onPressed: () {
            // Scroll to header section
            scrollToSection(navItems[0].key.currentContext!);
          },
          child: const Icon(
            FontAwesomeIcons.arrowUp,
            size: Sizes.iconSize18,
            color: AppColors.white,
          ),
        ),
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
                return NavSectionWeb(
                  navItems: navItems,
                );
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
                          child: Image.asset(ImagePath.blobBeanAsh),
                        ),
                      ),
                      Column(
                        children: [
                          HeaderSection(
                            key: navItems[0].key,
                          ),
                          SizedBox(height: spacerHeight),
                          VisibilityDetector(
                            key: const Key("wiki"),
                            onVisibilityChanged: (visibilityInfo) {
                              double visiblePercentage =
                                  visibilityInfo.visibleFraction * 100;
                              if (visiblePercentage > 10) {
                                _controller.forward();
                              }
                            },
                            child: Container(
                              key: navItems[1].key,
                              child: const AboutMeSection(),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: spacerHeight),
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
                          Container(
                            key: navItems[2].key,
                            child: const SkillsSection(),
                          ),
                          SizedBox(height: spacerHeight),
                          const StatisticsSection(),
                          SizedBox(height: spacerHeight),
                          Container(
                            key: navItems[3].key,
                            child: const ProjectsSection(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: spacerHeight),
                  Stack(
                    children: [
                      Positioned(
                        left: -assignWidth(context, 0.6),
                        child: Image.asset(ImagePath.blobAsh),
                      ),
                      Column(
                        children: [
                          Container(
                            key: navItems[4].key,
                            child: const AwardsSection(),
                          ),
                          const FooterSection(),
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
