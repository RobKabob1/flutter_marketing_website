import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:deeps_website/presentation/layout/adaptive.dart';
import 'package:deeps_website/presentation/widgets/spaces.dart';
import 'package:deeps_website/utils/functions.dart';
import 'package:deeps_website/values/values.dart';

import 'nav_item.dart';

const kSpacing20 = Sizes.size20;

class AppDrawer extends StatefulWidget {
  final Color color;
  final double? width;
  final List<NavItemData> menuList;
  final GestureTapCallback? onClose;

  const AppDrawer({
    super.key,
    this.color = AppColors.black200,
    this.width,
    required this.menuList,
    this.onClose,
  });

  @override
  AppDrawerState createState() => AppDrawerState();
}

class AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    double defaultWidthOfDrawer = responsiveSize(
      context,
      assignWidth(context, 0.85),
      assignWidth(context, 0.60),
      md: assignWidth(context, 0.60),
    );
    return SizedBox(
      width: widget.width ?? defaultWidthOfDrawer,
      child: Drawer(
        child: Container(
          color: widget.color,
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.padding24,
            vertical: Sizes.padding24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      ImagePath.logoLight,
                      height: Sizes.height52,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: widget.onClose ?? () => _closeDrawer(),
                    child: const Icon(
                      Icons.close,
                      size: Sizes.iconSize30,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 2),
              ..._buildMenuList(
                context: context,
                menuList: widget.menuList,
              ),
              const Spacer(flex: 6),
              _buildFooterText(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildMenuList({
    required BuildContext context,
    required List<NavItemData> menuList,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;
    List<Widget> menuItems = [];
    for (var i = 0; i < menuList.length; i++) {
      menuItems.add(
        NavItem(
          onTap: () => _onTapNavItem(
            context: menuList[i].key,
            navItemName: menuList[i].name,
          ),
          title: menuList[i].name,
          isMobile: true,
          isSelected: menuList[i].isSelected,
          titleStyle: textTheme.bodyLarge?.copyWith(
            color:
                menuList[i].isSelected ? AppColors.primary200 : AppColors.white,
            fontSize: Sizes.textSize16,
            fontWeight:
                menuList[i].isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      );
      menuItems.add(const Spacer());
    }
    return menuItems;
  }

  _onTapNavItem({
    required GlobalKey context,
    required String navItemName,
  }) {
    for (int index = 0; index < widget.menuList.length; index++) {
      if (navItemName == widget.menuList[index].name) {
        scrollToSection(context.currentContext!);
        setState(() {
          widget.menuList[index].isSelected = true;
        });
        _closeDrawer();
      } else {
        widget.menuList[index].isSelected = false;
      }
    }
  }

  _closeDrawer() {
    context.router.pop();
  }

  Widget _buildFooterText() {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? footerTextStyle = textTheme.bodySmall?.copyWith(
      color: AppColors.primaryText2,
      fontWeight: FontWeight.bold,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: SelectableText.rich(
            TextSpan(
              text: "${StringConst.rightsReserved} ",
              style: footerTextStyle,
              children: [
                const TextSpan(text: "${StringConst.designedBy} "),
                TextSpan(
                  text: StringConst.stepPay,
                  style: footerTextStyle?.copyWith(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w900,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                text: "${StringConst.builtBy} ",
                style: footerTextStyle,
                children: [
                  TextSpan(
                    text: "${StringConst.stepPay}. ",
                    style: footerTextStyle?.copyWith(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w900,
                      color: AppColors.white,
                    ),
                  ),
                ],
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
      ],
    );
  }
}
