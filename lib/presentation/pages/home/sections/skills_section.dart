import 'package:flutter/material.dart';
import 'package:deeps_website/presentation/layout/adaptive.dart';
import 'package:deeps_website/presentation/widgets/content_area.dart';
import 'package:deeps_website/presentation/widgets/deeps_website_info_section.dart';
import 'package:deeps_website/presentation/widgets/skill_card.dart';
import 'package:deeps_website/presentation/widgets/skill_level.dart';
import 'package:deeps_website/presentation/widgets/spaces.dart';
import 'package:deeps_website/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:visibility_detector/visibility_detector.dart';

const double kRunSpacing = 20.0;
const double kMainAxisSpacing = 16.0;
const double kCrossAxisSpacing = 16.0;

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});
  @override
  SkillsSectionState createState() => SkillsSectionState();
}

class SkillsSectionState extends State<SkillsSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    // _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = widthOfScreen(context) - (getSidePadding(context) * 2);
    double screenHeight = heightOfScreen(context);
    double contentAreaWidthLg = screenWidth * 0.5;
    double contentAreaWidthSm = screenWidth;
    double contentAreaHeight = responsiveSize(
      context,
      screenHeight * 1.6,
      screenHeight * 0.8,
      md: screenHeight * 0.8,
      sm: screenHeight * 1.6,
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: getSidePadding(context)),
      child: ResponsiveBuilder(
        refinedBreakpoints: const RefinedBreakpoints(),
        builder: (context, sizingInformation) {
          double screenWidth = sizingInformation.screenSize.width;
          if (screenWidth <= const RefinedBreakpoints().tabletSmall) {
            return VisibilityDetector(
              key: const Key('skills-section-sm'),
              onVisibilityChanged: (visibilityInfo) {
                double visiblePercentage = visibilityInfo.visibleFraction * 100;
                if (visiblePercentage > 20) {
                  _controller.forward();
                }
              },
              child: Column(
                children: [
                  ContentArea(
                    width: contentAreaWidthSm,
                    child: _buildDeepsWebsiteSm(width: contentAreaWidthSm),
                  ),
                  const SpaceH40(),
                  ContentArea(
                    width: contentAreaWidthSm,
                    child: Center(
                      child: Column(
                        children: _buildBoxesSm(Data.skillCardData),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (screenWidth > const RefinedBreakpoints().tabletSmall &&
              screenWidth <= 1024) {
            return VisibilityDetector(
              key: const Key('skills-section-md'),
              onVisibilityChanged: (visibilityInfo) {
                double visiblePercentage = visibilityInfo.visibleFraction * 100;
                if (visiblePercentage > 25) {
                  _controller.forward();
                }
              },
              child: Column(
                children: [
                  ContentArea(
                    width: contentAreaWidthSm,
                    child: _buildDeepsWebsiteSm(width: contentAreaWidthSm),
                  ),
                  const SpaceH40(),
                  ContentArea(
                    width: contentAreaWidthSm,
                    child: Center(
                      child: _buildSkillBoxes(boxHeight: 250),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return VisibilityDetector(
              key: const Key('skills-section-lg'),
              onVisibilityChanged: (visibilityInfo) {
                double visiblePercentage = visibilityInfo.visibleFraction * 100;
                if (visiblePercentage > 50) {
                  _controller.forward();
                }
              },
              child: Row(
                children: [
                  ContentArea(
                    width: contentAreaWidthLg,
                    child: _buildDeepsWebsiteLg(width: contentAreaWidthLg),
                  ),
                  ContentArea(
                    width: contentAreaWidthLg,
                    height: contentAreaHeight,
                    padding:
                        const EdgeInsets.symmetric(horizontal: Sizes.height48),
                    child: Center(
                      child: _buildSkillBoxes(
                        boxHeight: 250,
                        crossAxisCount: 2,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  List<Widget> _buildSkillSection(
    List<SkillLevelData> skillLevels,
    double width,
  ) {
    List<Widget> items = [];
    for (int index = 0; index < skillLevels.length; index++) {
      items.add(
        SkillLevel(
          skillLevelWidth: width,
          controller: _controller,
          skill: skillLevels[index].skill,
          level: skillLevels[index].level,
        ),
      );
    }
    return items;
  }

  Widget _buildSkillBoxes({
    required double boxHeight,
    int crossAxisCount = 2,
  }) {
    return const Placeholder();
  }

  List<Widget> _buildBoxesSm(List<SkillCardData> skill) {
    List<Widget> items = [];
    for (int index = 0; index < skill.length; index++) {
      if (index != 1 && index != 5) {
        items.add(
          SkillCard(
            width: widthOfScreen(context),
            height: 200,
            title: skill[index].title,
            description: skill[index].description,
            iconData: skill[index].iconData,
          ),
        );
        items.add(const SpaceH16());
      }
    }
    return items;
  }

  Widget _buildDeepsWebsiteLg({required double width}) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DeepsWebsiteInfoSection1(
                sectionTitle: StringConst.mySkills,
                title1: StringConst.skillsTitle1,
                title2: StringConst.skillsTitle2,
                body: StringConst.skillsDesc,
                child: Wrap(
                  runSpacing: kRunSpacing,
                  children: _buildSkillSection(
                    Data.skillLevelData,
                    width,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDeepsWebsiteSm({required double width}) {
    return DeepsWebsiteInfoSection2(
      sectionTitle: StringConst.mySkills,
      title1: StringConst.skillsTitle1,
      title2: StringConst.skillsTitle2,
      body: StringConst.skillsDesc,
      child: Wrap(
        runSpacing: kRunSpacing,
        children: _buildSkillSection(
          Data.skillLevelData,
          width,
        ),
      ),
    );
  }
}
