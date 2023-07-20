import 'package:flutter/material.dart';
import 'package:deeps_website/values/values.dart';
import 'package:url_launcher/link.dart';

import 'deeps_website_button.dart';

class DeepsWebsiteButtonLink extends StatelessWidget {
  const DeepsWebsiteButtonLink({
    Key? key,
    required this.buttonTitle,
    required this.url,
    this.linkTarget = LinkTarget.blank,
    this.buttonColor = AppColors.black400,
    this.builder,
    this.width = Sizes.width150,
    this.height = Sizes.height60,
  }) : super(key: key);

  final String url;
  final String buttonTitle;
  final LinkTarget linkTarget;

  final Color buttonColor;
  final double? width;
  final double? height;
  final LinkWidgetBuilder? builder;

  @override
  Widget build(BuildContext context) {
    return Link(
      uri: Uri.parse(url),
      target: linkTarget,
      builder: (context, followLink) {
        return DeepsWebsiteButton(
          width: width,
          height: height,
          buttonTitle: buttonTitle,
          buttonColor: buttonColor,
          onPressed: () => followLink,
        );
      },
    );
  }
}
