import 'package:flutter/material.dart';
import 'package:deeps_website/presentation/layout/adaptive.dart';
import 'package:deeps_website/presentation/widgets/buttons/social_button_2.dart';
import 'package:deeps_website/presentation/widgets/content_area.dart';
import 'package:deeps_website/presentation/widgets/empty.dart';
import 'package:deeps_website/presentation/widgets/deeps_website_info_section.dart';
import 'package:deeps_website/presentation/widgets/spaces.dart';
import 'package:deeps_website/utils/functions.dart';
import 'package:deeps_website/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:visibility_detector/visibility_detector.dart';

const double kSpacingSm = 40.0;
const double kRunSpacingSm = 24.0;
const double kSpacingLg = 24.0;
const double kRunSpacingLg = 16.0;

class AboutMeSection extends StatefulWidget {
  const AboutMeSection({super.key});
  @override
  AboutMeSectionState createState() => AboutMeSectionState();
}

class AboutMeSectionState extends State<AboutMeSection>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  late AnimationController _fadeInController;
  late Animation<double> _fadeInAnimation;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 750),
      vsync: this,
    );
    _fadeInController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _scaleAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _scaleController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    _fadeInAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _fadeInController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    _scaleController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _fadeInController.forward();
      }
    });
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _fadeInController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = widthOfScreen(context) - getSidePadding(context);
    double screenHeight = heightOfScreen(context);
    double contentAreaWidthSm = screenWidth * 1.0;
    double contentAreaHeightSm = screenHeight * 0.6;
    double contentAreaWidthLg = screenWidth * 0.5;
    return VisibilityDetector(
      key: const Key('about-section'),
      onVisibilityChanged: (visibilityInfo) {
        double visiblePercentage = visibilityInfo.visibleFraction * 100;
        if (visiblePercentage > 25) {
          _scaleController.forward();
        }
      },
      child: Container(
        padding: EdgeInsets.only(left: getSidePadding(context)),
        child: ResponsiveBuilder(
          refinedBreakpoints: const RefinedBreakpoints(),
          builder: (context, sizingInformation) {
            double screenWidth = sizingInformation.screenSize.width;
            if (screenWidth < (const RefinedBreakpoints().tabletLarge)) {
              return Column(
                children: [
                  ContentArea(
                    width: contentAreaWidthSm,
                    child: _buildImage(
                      width: contentAreaWidthSm,
                      height: contentAreaHeightSm,
                    ),
                  ),
                  const SpaceH40(),
                  ContentArea(
                    width: contentAreaWidthSm,
                    child: _buildAboutMe(
                      width: contentAreaWidthSm,
                      height: screenHeight,
                    ),
                  ),
                ],
              );
            } else {
              return Row(
                children: [
                  ContentArea(
                    width: contentAreaWidthLg,
                    child: _buildImage(
                      width: contentAreaWidthLg,
                      height: screenHeight,
                    ),
                  ),
                  ContentArea(
                    width: contentAreaWidthLg,
                    child: _buildAboutMe(
                      width: contentAreaWidthLg,
                      height: screenHeight,
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  List<Widget> _buildSocialButtons(
    List<SocialButton2Data> data, {
    double? width,
  }) {
    List<Widget> items = [];

    for (int index = 0; index < data.length; index++) {
      items.add(
        SocialButton2(
          width: width,
          title: data[index].title.toUpperCase(),
          iconData: data[index].iconData,
          onPressed: () => openUrlLink(data[index].url),
          titleColor: data[index].titleColor,
          buttonColor: data[index].buttonColor,
          iconColor: data[index].iconColor,
        ),
        // deeps_websiteLink(
        //   url: data[index].url,
        //   child: SocialButton2(
        //     width: width,
        //     title: data[index].title.toUpperCase(),
        //     iconData: data[index].iconData,
        //     onPressed: () {},
        //     titleColor: data[index].titleColor,
        //     buttonColor: data[index].buttonColor,
        //     iconColor: data[index].iconColor,
        //   ),
        // ),
      );
    }
    return items;
  }

  Widget _buildImage({required double width, required double height}) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double fontSize = responsiveSize(context, 60, 72, md: 64);
    TextStyle? titleStyle = textTheme.bodyLarge?.merge(
      Styles.customTextStyle3(fontSize: fontSize, height: 1.25),
    );

    return Stack(
      children: [
        Positioned(
          top: height * 0.1,
          right: -(width * 0.20),
          child: ResponsiveBuilder(
            refinedBreakpoints: const RefinedBreakpoints(),
            builder: (context, sizingInformation) {
              double screenWidth = sizingInformation.screenSize.width;
              if (screenWidth < (const RefinedBreakpoints().tabletLarge)) {
                return Image.asset(
                  ImagePath.blobBlack,
                  height: height * 0.25,
                  width: width * 0.25,
                );
              } else {
                return const Empty();
              }
            },
          ),
        ),
        Stack(
          children: [
            Positioned(
              left: 0,
              bottom: 0,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Image.asset(
                  ImagePath.dotsGlobeGrey,
                  width: 180,
                  height: 180,
                ),
              ),
            ),
            ScaleTransition(
              scale: _scaleAnimation,
              child: Image.asset(
                ImagePath.devAboutMe,
                width: width * 0.95,
              ),
            ),
          ],
        ),
        Positioned(
          top: width * 0.2,
          left: width * 0.2,
          child: FadeTransition(
            opacity: _fadeInAnimation,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringConst.hi,
                  style: titleStyle,
                ),
                Text(
                  StringConst.there,
                  style: titleStyle,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAboutMe({
    required double width,
    required double height,
  }) {
    return Stack(
      children: [
        //positions blob on the far right of the section
        //based on the calculation only 10% of blob is showing
        Positioned(
          top: height * 0.2,
          left: width * 0.90,
          child: ResponsiveBuilder(
            refinedBreakpoints: const RefinedBreakpoints(),
            builder: (context, sizingInformation) {
              double screenWidth = sizingInformation.screenSize.width;
              if (screenWidth < (const RefinedBreakpoints().tabletLarge)) {
                return const Empty();
              } else {
                return Image.asset(
                  ImagePath.blobBlack,
                  height: height * 0.30,
                  width: width * 0.30,
                );
              }
            },
          ),
        ),

        ResponsiveBuilder(
          refinedBreakpoints: const RefinedBreakpoints(),
          builder: (context, sizingInformation) {
            double screenWidth = sizingInformation.screenSize.width;
            if (screenWidth < (const RefinedBreakpoints().tabletNormal)) {
              return deepsWebsiteInfoSectionSm(width: width);
            } else {
              //This container takes 85% of the space and leave 15% as spacing
              //between the blob and the content
              return SizedBox(
                width: width * 0.85,
                child: deepsWebsiteInfoSectionLg(),
              );
            }
          },
        ),
      ],
    );
  }

  Widget deepsWebsiteInfoSectionLg() {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DeepsWebsiteInfoSection1(
                sectionTitle: StringConst.aboutMe,
                title1: StringConst.creativeDesign,
                title2: StringConst.help,
                body: StringConst.aboutMeDesc,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringConst.followMe1,
                      style: textTheme.titleLarge?.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    const SpaceH16(),
                    Wrap(
                      spacing: kSpacingLg,
                      runSpacing: kRunSpacingLg,
                      children: _buildSocialButtons(
                        Data.socialData2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget deepsWebsiteInfoSectionSm({required double width}) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return DeepsWebsiteInfoSection2(
      sectionTitle: StringConst.aboutMe,
      title1: StringConst.creativeDesign,
      title2: StringConst.help,
      body: StringConst.aboutMeDesc,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringConst.followMe1,
            style: textTheme.titleLarge?.copyWith(color: AppColors.black),
          ),
          const SpaceH16(),
          Wrap(
            spacing: kSpacingSm,
            runSpacing: kRunSpacingSm,
            children: _buildSocialButtons(Data.socialData2),
          ),
        ],
      ),
    );
  }
}
