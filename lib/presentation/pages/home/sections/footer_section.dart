import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:deeps_website/presentation/layout/adaptive.dart';
import 'package:deeps_website/presentation/widgets/buttons/deeps_website_button.dart';
import 'package:deeps_website/presentation/widgets/content_area.dart';
import 'package:deeps_website/presentation/widgets/buttons/deeps_website_button_link.dart';
import 'package:deeps_website/presentation/widgets/spaces.dart';
import 'package:deeps_website/utils/functions.dart';
import 'package:deeps_website/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

List<FooterItem> footerItems = [
  const FooterItem(
    title: "${StringConst.phoneMe}:",
    subtitle: StringConst.phoneNumber,
    iconData: FeatherIcons.phone,
  ),
  const FooterItem(
    title: "${StringConst.mailMe}:",
    subtitle: StringConst.devEmail,
    iconData: FontAwesomeIcons.paperPlane,
  ),
  const FooterItem(
    title: "${StringConst.followMe2}:",
    subtitle: StringConst.behanceID,
    iconData: FontAwesomeIcons.behance,
  ),
];

class FooterSection extends StatefulWidget {
  const FooterSection({super.key});
  @override
  FooterSectionState createState() => FooterSectionState();
}

class FooterSectionState extends State<FooterSection> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? footerTextStyle = textTheme.bodySmall?.copyWith(
      color: AppColors.primaryText2,
      fontWeight: FontWeight.bold,
    );
    double screenWidth = widthOfScreen(context) - (getSidePadding(context) * 2);
    double screenHeight = heightOfScreen(context);
    double contentAreaWidth = screenWidth;
    double contentAreaHeight = responsiveSize(
      context,
      screenHeight,
      screenHeight * 0.7,
      md: screenHeight * 0.85,
      sm: screenHeight * 0.85,
    );

    return ContentArea(
      padding: EdgeInsets.symmetric(horizontal: getSidePadding(context)),
      child: Column(
        children: [
          ResponsiveBuilder(
            builder: (context, sizingInformation) {
              double screenWidth = sizingInformation.screenSize.width;

              if (screenWidth <= (const RefinedBreakpoints().tabletNormal)) {
                return _buildFooterSectionSm(
                  width: contentAreaWidth,
                  height: contentAreaHeight,
                );
              } else {
                return _buildFooterSectionLg(
                  width: contentAreaWidth,
                  height: contentAreaHeight,
                );
              }
            },
          ),
          const SpaceH20(),
          InkWell(
            onTap: () => openUrlLink(StringConst.stepPayURL),
            child: RichText(
              text: TextSpan(
                text: "${StringConst.rightsReserved} ",
                style: footerTextStyle,
                children: [
                  const TextSpan(text: "${StringConst.designedBy} "),
                  TextSpan(
                    text: StringConst.stepPay,
                    style: footerTextStyle?.copyWith(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w900,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // deeps_websiteLink(
          //   url: StringConst.WEB_GENIUS_LAB_URL,
          //   child: RichText(
          //     text: TextSpan(
          //       text: StringConst.RIGHTS_RESERVED + " ",
          //       style: footerTextStyle,
          //       children: [
          //         TextSpan(text: StringConst.DESIGNED_BY + " "),
          //         TextSpan(
          //           text: StringConst.WEB_GENIUS_LAB,
          //           style: footerTextStyle?.copyWith(
          //             decoration: TextDecoration.underline,
          //             fontWeight: FontWeight.w900,
          //             color: AppColors.black,
          //           ),
          //         ),
          //       ],
          //     ),
          //     textAlign: TextAlign.center,
          //   ),
          // ),
          const SpaceH4(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: InkWell(
                    onTap: () => openUrlLink(StringConst.stepPayURL),
                    child: RichText(
                      text: TextSpan(
                        text: "${StringConst.builtBy} ",
                        style: footerTextStyle,
                        children: [
                          TextSpan(
                            text: "${StringConst.stepPay}. ",
                            style: footerTextStyle?.copyWith(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w900,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //  deeps_websiteLink(
                  //   url: StringConst.DAVID_LEGEND_URL,
                  //   child: RichText(
                  //     text: TextSpan(
                  //       text: StringConst.BUILT_BY + " ",
                  //       style: footerTextStyle,
                  //       children: [
                  //         TextSpan(
                  //           text: StringConst.DAVID_COBBINA + ". ",
                  //           style: footerTextStyle?.copyWith(
                  //             decoration: TextDecoration.underline,
                  //             fontWeight: FontWeight.w900,
                  //             color: AppColors.black,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ),
              ),
            ],
          ),
          const SpaceH4(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(StringConst.madeInUSA, style: footerTextStyle),
              const SpaceW4(),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image.asset(
                  ImagePath.ghanaFlag,
                  width: Sizes.width16,
                  height: Sizes.height16,
                  fit: BoxFit.cover,
                ),
              ),
              const SpaceW4(),
              Text(StringConst.withLove, style: footerTextStyle),
              const SpaceW4(),
              const Icon(
                FontAwesomeIcons.solidHeart,
                color: AppColors.red,
                size: Sizes.iconSize12,
              ),
            ],
          ),
          const SpaceH20(),
        ],
      ),
    );
  }

  List<Widget> _buildFooterItems(List<FooterItem> data,
      {bool isHorizontal = false}) {
    List<Widget> items = [];

    for (int index = 0; index < data.length; index++) {
      items.add(
        FooterItem(
          title: data[index].title,
          subtitle: data[index].subtitle,
          iconData: data[index].iconData,
        ),
      );
      if (index < data.length - 1) {
        if (isHorizontal) {
          items.add(const Spacer(flex: 2));
        } else {
          items.add(const SpaceH40());
        }
      }
    }
    return items;
  }

  Widget _buildFooterSectionSm({
    required double width,
    required double height,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return ContentArea(
      width: width,
      backgroundColor: AppColors.black400,
      borderRadius: const BorderRadius.all(
        Radius.circular(Sizes.radius8),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(Sizes.radius8),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -(height * 0.1),
              left: -(height * 0.15),
              child: Image.asset(
                ImagePath.boxCoverGold,
                // width: width * 0.6 ,
                height: height * 0.5,
                // fit: BoxFit.fill,
              ),
            ),
            Positioned(
              bottom: -(height * 0.1),
              right: -(height * 0.1),
              child: Image.asset(
                ImagePath.boxCoverBlack,
                height: height * 0.6,
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Column(
                children: [
                  const SpaceH80(),
                  Text(
                    StringConst.letsTalk,
                    textAlign: TextAlign.center,
                    style: textTheme.headlineMedium
                        ?.copyWith(color: AppColors.white),
                  ),
                  const SpaceH60(),
                  ..._buildFooterItems(footerItems),
                  const SpaceH60(),
                  DeepsWebsiteButton(
                    buttonTitle: StringConst.hireMe,
                    buttonColor: AppColors.primaryColor,
                    onPressed: () {},
                  ),
                  const SpaceH80(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooterSectionLg({
    required double width,
    required double height,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return ContentArea(
      width: width,
      height: height,
      backgroundColor: AppColors.black400,
      borderRadius: const BorderRadius.all(
        Radius.circular(Sizes.radius8),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(Sizes.radius8),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -(height * 0.15),
              left: -(height * 0.15),
              child: Image.asset(
                ImagePath.boxCoverGold,
                // width: width ,
                height: height * 0.5,
                // fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: -(height * 0.15),
              right: -(height * 0.1),
              // bottom: -25,
              child: Image.asset(
                ImagePath.boxCoverBlack,
                height: height * 1.25,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                const Spacer(flex: 2),
                Text(
                  StringConst.letsTalk,
                  style:
                      textTheme.displaySmall?.copyWith(color: AppColors.white),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(flex: 3),
                    ..._buildFooterItems(footerItems, isHorizontal: true),
                    const Spacer(flex: 3),
                  ],
                ),
                const Spacer(),
                const DeepsWebsiteButtonLink(
                  url: StringConst.emailURL,
                  buttonTitle: StringConst.hireMe,
                  buttonColor: AppColors.primaryColor,
                ),
                const Spacer(flex: 2),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FooterItem extends StatelessWidget {
  const FooterItem({
    super.key,
    required this.iconData,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Icon(
          iconData,
          color: AppColors.primaryColor,
          size: Sizes.iconSize36,
        ),
        const SpaceH8(),
        Text(
          title,
          style: textTheme.titleMedium?.copyWith(
            color: AppColors.white,
          ),
        ),
        const SpaceH8(),
        Text(
          subtitle,
          style: textTheme.bodyLarge?.copyWith(
            color: AppColors.grey250,
          ),
        ),
      ],
    );
  }
}
