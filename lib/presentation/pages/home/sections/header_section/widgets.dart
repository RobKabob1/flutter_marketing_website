import 'package:flutter/material.dart';
import 'package:deeps_website/presentation/layout/adaptive.dart';
import 'package:deeps_website/presentation/widgets/circular_container.dart';
import 'package:deeps_website/presentation/widgets/deeps_website_card.dart';
import 'package:deeps_website/presentation/widgets/spaces.dart';
import 'package:deeps_website/values/values.dart';

class HeaderImage extends StatefulWidget {
  const HeaderImage({
    Key? key,
    required this.controller,
    this.globeSize = 150,
    this.imageHeight,
    this.imageWidth,
    this.fit,
  }) : super(key: key);

  final double? globeSize;
  final double? imageWidth;
  final double? imageHeight;
  final BoxFit? fit;
  final AnimationController controller;

  @override
  HeaderImageState createState() => HeaderImageState();
}

class HeaderImageState extends State<HeaderImage> {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          child: RotationTransition(
            turns: widget.controller,
            child: Image.asset(
              ImagePath.dotsGlobeGrey,
              height: widget.globeSize,
              width: widget.globeSize,
            ),
          ),
        ),
        Image.asset(
          ImagePath.planetHeader,
          width: widget.imageWidth,
          height: widget.imageHeight,
          fit: widget.fit,
        ),
      ],
    );
  }
}

List<Widget> buildCardRow({
  required BuildContext context,
  required List<DeepsWebsiteCardData> data,
  required double width,
  bool isHorizontal = true,
  bool isWrap = false,
  bool hasAnimation = true,
}) {
  TextTheme textTheme = Theme.of(context).textTheme;
  List<Widget> items = [];

  double cardWidth = responsiveSize(
    context,
    Sizes.width32,
    Sizes.width40,
    md: Sizes.width36,
  );
  double iconSize = responsiveSize(
    context,
    Sizes.iconSize18,
    Sizes.iconSize24,
  );
  double trailingIconSize = responsiveSize(
    context,
    Sizes.iconSize28,
    Sizes.iconSize30,
    md: Sizes.iconSize30,
  );
  for (int index = 0; index < data.length; index++) {
    items.add(
      DeepsWebsiteCard(
        width: width,
        height: responsiveSize(
          context,
          125,
          140,
        ),
        hasAnimation: hasAnimation,
        leading: CircularContainer(
          width: cardWidth,
          height: cardWidth,
          iconSize: iconSize,
          backgroundColor: data[index].circleBgColor,
          iconColor: data[index].leadingIconColor,
        ),
        title: Flexible(
          child: SelectableText(
            data[index].title,
            style: textTheme.titleMedium?.copyWith(
              fontSize: responsiveSize(
                context,
                Sizes.textSize16,
                Sizes.textSize18,
              ),
            ),
          ),
        ),
        subtitle: Flexible(
          child: SelectableText(
            data[index].subtitle,
            style: textTheme.bodyLarge?.copyWith(
                fontSize: responsiveSize(
              context,
              Sizes.textSize14,
              Sizes.textSize16,
            )),
          ),
        ),
        trailing: Icon(
          Icons.chevron_right,
          size: trailingIconSize,
          color: data[index].trailingIconColor,
        ),
      ),
    );
    //run this only on mobile devices and laptops but not on tablets.
    // We use `Wrap` to make the widgets wrap on the tablet view
    if (!isWrap) {
      if (isHorizontal) {
        items.add(const SpaceW36());
      } else {
        items.add(const SpaceH30());
      }
    }
  }

  return items;
}

double computeHeight(double offset, double sizeOfGlobe, double sizeOfBlob) {
  double sum = (offset + sizeOfGlobe) - sizeOfBlob;
  if (sum < 0) {
    return sizeOfBlob;
  } else {
    return sum + sizeOfBlob;
  }
}
