import 'package:flutter/material.dart';
import 'package:deeps_website/presentation/layout/adaptive.dart';
import 'package:deeps_website/values/values.dart';
import 'package:url_launcher/link.dart';

class DeepsWebsiteButton extends StatelessWidget {
  const DeepsWebsiteButton({
    super.key,
    required this.buttonTitle,
    this.width = Sizes.width150,
    this.height = Sizes.height60,
    this.titleStyle,
    this.titleColor = AppColors.white,
    this.buttonColor = AppColors.black400,
    this.onPressed,
    this.padding = const EdgeInsets.all(Sizes.padding8),
    this.borderRadius = const BorderRadius.all(
      Radius.circular(Sizes.radius4),
    ),
    this.opensUrl = false,
    this.url = "",
    this.linkTarget = LinkTarget.blank,
  });

  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final String buttonTitle;
  final TextStyle? titleStyle;
  final Color titleColor;
  final Color buttonColor;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry padding;
  final String url;
  final LinkTarget linkTarget;
  final bool opensUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: MaterialButton(
        minWidth: width,
        height: height,
        onPressed: opensUrl ? () {} : onPressed,
        color: buttonColor,
        child: Padding(
          padding: padding,
          child: buildChild(context),
        ),
      ),
    );
  }

  Widget buildChild(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double textSize = responsiveSize(
      context,
      Sizes.textSize14,
      Sizes.textSize16,
      md: Sizes.textSize15,
    );
    if (opensUrl) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Link(
          uri: Uri.parse(url),
          target: linkTarget,
          builder: (context, followLink) {
            return GestureDetector(
              onTap: followLink,
              child: Text(
                buttonTitle,
                style: titleStyle ??
                    textTheme.labelLarge?.copyWith(
                      color: titleColor,
                      fontSize: textSize,
                      letterSpacing: 1.1,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            );
          },
        ),
      );
    } else {
      return Text(
        buttonTitle,
        style: titleStyle ??
            textTheme.labelLarge?.copyWith(
              color: titleColor,
              fontSize: textSize,
              letterSpacing: 1.1,
              fontWeight: FontWeight.bold,
            ),
      );
    }
  }
}