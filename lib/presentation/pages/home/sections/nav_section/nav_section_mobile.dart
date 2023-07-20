import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:deeps_website/presentation/widgets/spaces.dart';
import 'package:deeps_website/values/values.dart';

class NavSectionMobile extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const NavSectionMobile({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.height100,
      decoration: const BoxDecoration(
        color: AppColors.black100,
      ),
      child: Row(
        children: [
          const SpaceW30(),
          IconButton(
            icon: const Icon(
              FeatherIcons.menu,
              color: AppColors.white,
              size: Sizes.iconSize26,
            ),
            onPressed: () {
              if (scaffoldKey.currentState!.isEndDrawerOpen) {
                scaffoldKey.currentState?.openEndDrawer();
              } else {
                scaffoldKey.currentState?.openDrawer();
              }
            },
          ),
          const Spacer(),
          InkWell(
            onTap: () {},
            child: Image.asset(
              ImagePath.logoLight,
              height: Sizes.height52,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
