import 'package:flutter/material.dart';
import 'package:deeps_website/presentation/layout/adaptive.dart';
import 'package:deeps_website/presentation/widgets/bullet_text.dart';
import 'package:deeps_website/presentation/widgets/content_area.dart';
import 'package:deeps_website/presentation/widgets/deeps_website_info_section.dart';
import 'package:deeps_website/presentation/widgets/spaces.dart';
import 'package:deeps_website/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AwardsSection extends StatefulWidget {
  const AwardsSection({super.key});
  @override
  AwardsSectionState createState() => AwardsSectionState();
}

class AwardsSectionState extends State<AwardsSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool text1InView = false;
  bool text2InView = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();

    _controller.forward();
    _controller.addListener(() {
      if (_controller.status == AnimationStatus.completed) {
        _controller.reset();
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = widthOfScreen(context) - (getSidePadding(context));
    double screenHeight = heightOfScreen(context);
    double contentAreaWidth = responsiveSize(
      context,
      screenWidth,
      screenWidth * 0.5,
      md: screenWidth * 0.5,
    );
    double contentAreaHeight = screenHeight * 0.9;
    return VisibilityDetector(
      key: const Key('awards-section'),
      onVisibilityChanged: (visibilityInfo) {
        double visiblePercentage = visibilityInfo.visibleFraction * 100;
        if (visiblePercentage > 50) {
          setState(() {
            text1InView = true;
          });
        }
      },
      child: Container(
        padding: EdgeInsets.only(left: getSidePadding(context)),
        child: ResponsiveBuilder(
          refinedBreakpoints: const RefinedBreakpoints(),
          builder: (context, sizingInformation) {
            double screenWidth = sizingInformation.screenSize.width;
            if (screenWidth <= 1024) {
              return Column(
                children: [
                  ResponsiveBuilder(
                    builder: (context, sizingInformation) {
                      double screenWidth = sizingInformation.screenSize.width;
                      if (screenWidth <
                          (const RefinedBreakpoints().tabletSmall)) {
                        return _builddeepsWebsiteInfoSectionSm();
                      } else {
                        return _builddeepsWebsiteInfoSectionLg();
                      }
                    },
                  ),
                  const SpaceH50(),
                  ResponsiveBuilder(
                    builder: (context, sizingInformation) {
                      double screenWidth = sizingInformation.screenSize.width;
                      if (screenWidth <
                          (const RefinedBreakpoints().tabletSmall)) {
                        return _buildImage(
                          width: screenWidth,
                          height: screenHeight * 0.5,
                        );
                      } else {
                        return Center(
                          child: _buildImage(
                            width: screenWidth * 0.75,
                            height: screenHeight * 0.75,
                          ),
                        );
                      }
                    },
                  ),
                ],
              );
            } else {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContentArea(
                    width: contentAreaWidth,
                    height: contentAreaHeight,
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              const Spacer(),
                              _builddeepsWebsiteInfoSectionLg(),
                              const Spacer(flex: 2),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildImage(
                    width: contentAreaWidth,
                    height: contentAreaHeight,
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget _builddeepsWebsiteInfoSectionSm() {
    return DeepsWebsiteInfoSection2(
      sectionTitle: StringConst.myAwards,
      title1: StringConst.awardsTitle,
      hasTitle2: false,
      body: StringConst.awardsDesc,
      child: Column(
        children: [
          _buildAwards1(),
          const SpaceH40(),
          _buildAwards2(),
          const SpaceH40(),
        ],
      ),
    );
  }

  Widget _builddeepsWebsiteInfoSectionLg() {
    return DeepsWebsiteInfoSection1(
      sectionTitle: StringConst.myAwards,
      title1: StringConst.awardsTitle,
      hasTitle2: false,
      body: StringConst.awardsDesc,
      child: Row(
        children: [
          _buildAwards1(),
          const Spacer(),
          _buildAwards2(),
          const Spacer(flex: 4),
        ],
      ),
    );
  }

  Widget _buildImage({
    required double width,
    required double height,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? titleStyle = textTheme.bodyLarge?.merge(
      Styles.customTextStyle3(
        fontSize: responsiveSize(context, 64, 80, md: 76),
        height: 1.25,
        color: AppColors.primaryColor,
      ),
    );
    double textPosition = assignWidth(context, 0.1);
    return ContentArea(
      width: width,
      height: height,
      child: Stack(
        children: [
          Stack(
            children: [
              Positioned(
                left: 0,
                bottom: 0,
                child: ResponsiveBuilder(
                  refinedBreakpoints: const RefinedBreakpoints(),
                  builder: (context, sizingInformation) {
                    double screenWidth = sizingInformation.screenSize.width;
                    if (screenWidth <
                        (const RefinedBreakpoints().tabletSmall)) {
                      return RotationTransition(
                        turns: _controller,
                        child: Image.asset(
                          ImagePath.dotsGlobeYellow,
                          width: Sizes.width150,
                          height: Sizes.height150,
                        ),
                      );
                    } else {
                      return RotationTransition(
                        turns: _controller,
                        child: Image.asset(
                          ImagePath.dotsGlobeYellow,
                        ),
                      );
                    }
                  },
                ),
              ),
              Image.asset(
                ImagePath.devAward,
              ),
              AnimatedPositioned(
                left: text1InView ? textPosition : -150,
                curve: Curves.fastOutSlowIn,
                onEnd: () {
                  setState(() {
                    text2InView = true;
                  });
                },
                duration: const Duration(milliseconds: 750),
                child: Text(StringConst.my, style: titleStyle),
              ),
              AnimatedPositioned(
                right: text2InView ? textPosition : -150,
                curve: Curves.fastOutSlowIn,
                duration: const Duration(milliseconds: 750),
                child: Text(StringConst.cV, style: titleStyle),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAwards1() {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringConst.awardsTypeTitle1,
          style: textTheme.titleLarge,
        ),
        const SpaceH16(),
        ..._buildAwards(Data.awards1),
      ],
    );
  }

  Widget _buildAwards2() {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringConst.awardsTypeTitle2,
          style: textTheme.headlineSmall,
        ),
        const SpaceH16(),
        ..._buildAwards(Data.awards1),
      ],
    );
  }

  List<Widget> _buildAwards(List<String> awards) {
    List<Widget> items = [];
    for (int index = 0; index < awards.length; index++) {
      items.add(TextWithBullet(text: awards[index]));
      items.add(const SpaceH16());
    }
    return items;
  }
}