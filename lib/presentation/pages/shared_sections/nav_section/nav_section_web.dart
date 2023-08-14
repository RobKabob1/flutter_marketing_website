import 'package:flutter/material.dart';
import 'package:deeps_website/presentation/layout/adaptive.dart';
import 'package:deeps_website/presentation/widgets/buttons/deeps_website_button.dart';
import 'package:deeps_website/presentation/widgets/nav_item.dart';
import 'package:deeps_website/presentation/widgets/deeps_website_vertical_divider.dart';
import 'package:deeps_website/values/values.dart';
import 'package:go_router/go_router.dart';

const double logoSpaceLeftLg = 40.0;
const double logoSpaceLeftSm = 20.0;
const double logoSpaceRightLg = 70.0;
const double logoSpaceRightSm = 35.0;
const double contactButtonSpaceLeftLg = 60.0;
const double contactButtonSpaceLeftSm = 30.0;
const double contactButtonSpaceRightLg = 40.0;
const double contactButtonSpaceRightSm = 20.0;
const double contactBtnWidthLg = 150.0;
const double contactBtnWidthSm = 120.0;
const int menuSpacerRightLg = 5;
const int menuSpacerRightMd = 4;
const int menuSpacerRightSm = 3;

class NavSectionWeb extends StatefulWidget {
  final List<NavItemData> navItems = [
    NavItemData(name: StringConst.home, key: GlobalKey(), isSelected: true),
    NavItemData(name: StringConst.news, key: GlobalKey()),
    NavItemData(name: StringConst.wiki, key: GlobalKey()),
    //NavItemData(name: StringConst.leaderboards, key: GlobalKey()),
    //NavItemData(name: StringConst.stellarMap, key: GlobalKey()),
    NavItemData(name: StringConst.market, key: GlobalKey()),
  ];

  NavSectionWeb({super.key});

  @override
  NavSectionWebState createState() => NavSectionWebState();
}

class NavSectionWebState extends State<NavSectionWeb> {
  @override
  Widget build(BuildContext context) {
    double logoSpaceLeft =
        responsiveSize(context, logoSpaceLeftSm, logoSpaceLeftLg);
    double logoSpaceRight =
        responsiveSize(context, logoSpaceRightSm, logoSpaceRightLg);
    double contactBtnSpaceLeft = responsiveSize(
      context,
      contactButtonSpaceLeftSm,
      contactButtonSpaceLeftLg,
    );
    double contactBtnSpaceRight = responsiveSize(
      context,
      contactButtonSpaceRightSm,
      contactButtonSpaceRightLg,
    );
    double contactBtnWidth = responsiveSize(
      context,
      contactBtnWidthSm,
      contactBtnWidthLg,
    );
    int menuSpacerRight = responsiveSizeInt(
      context,
      menuSpacerRightSm,
      menuSpacerRightLg,
      md: menuSpacerRightMd,
    );

    return Container(
      height: Sizes.height100,
      decoration: const BoxDecoration(
        color: AppColors.black100,
        boxShadow: [
          Shadows.elevationShadow,
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            SizedBox(width: logoSpaceLeft),
            InkWell(
              onTap: () {},
              child: Image.asset(
                ImagePath.logoDark,
                height: Sizes.height52,
              ),
            ),
            SizedBox(width: logoSpaceRight),
            const DeepsWebsiteVerticalDivider(),
            const Spacer(flex: 1),
            ..._buildNavItems(widget.navItems),
            Spacer(flex: menuSpacerRight),
            const DeepsWebsiteVerticalDivider(),
            SizedBox(width: contactBtnSpaceLeft),
            DeepsWebsiteButton(
              buttonTitle: StringConst.registerLogin,
              width: contactBtnWidth,
              // onPressed: () => openUrlLink(StringConst.SendToRegister/LoginScreen),
              opensUrl: true,
              url: StringConst.emailURL,
            ),
            SizedBox(width: contactBtnSpaceRight),
          ],
        ),
      ),
    );
  }

  _onTapNavItem({
    required String navItemName,
  }) {
    for (int index = 0; index < widget.navItems.length; index++) {
      if (navItemName == widget.navItems[index].name) {
        if (navItemName == 'Home') {
          GoRouter.of(
            context,
          ).go('/');
        } else {
          GoRouter.of(
            context,
          ).go('/$navItemName');
        }
        setState(
          () {
            widget.navItems[index].isSelected = true;
          },
        );
      } else {
        widget.navItems[index].isSelected = false;
      }
    }
  }

  List<Widget> _buildNavItems(List<NavItemData> navItems) {
    List<Widget> items = [];

    for (int index = 0; index < navItems.length; index++) {
      items.add(
        NavItem(
          title: navItems[index].name,
          isSelected: navItems[index].isSelected,
          onTap: () => _onTapNavItem(
            navItemName: navItems[index].name,
          ),
        ),
      );
      items.add(const Spacer());
    }
    return items;
  }
}
