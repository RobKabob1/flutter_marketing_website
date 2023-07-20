import 'package:flutter/material.dart';
import 'package:deeps_website/presentation/widgets/spaces.dart';
import 'package:deeps_website/values/values.dart';

class SocialButton2Data {
  final String title;
  final String url;
  final IconData iconData;
  final Color? iconColor;
  final Color? buttonColor;
  final Color? titleColor;

  SocialButton2Data({
    required this.title,
    required this.iconData,
    required this.url,
    this.iconColor,
    this.buttonColor,
    this.titleColor,
  });
}

class SocialButton2 extends StatefulWidget {
  const SocialButton2({
    super.key,
    required this.title,
    required this.iconData,
    required this.onPressed,
    this.titleStyle,
    this.titleColor = AppColors.black,
    this.buttonWidth = Sizes.width40,
    this.buttonHeight = Sizes.height40,
    this.width,
    this.height,
    this.elevation = Sizes.elevation1,
    this.buttonColor = AppColors.white,
    this.hoverButtonColor = AppColors.grey70,
    this.hoverTextColor = AppColors.black400,
    this.iconColor = AppColors.black,
    this.iconSize = Sizes.iconSize20,
    this.hasTitle = true,
  });

  final String title;
  final Color? titleColor;
  final TextStyle? titleStyle;
  final bool hasTitle;
  final double buttonWidth;
  final double buttonHeight;
  final double? width;
  final double? height;
  final double elevation;
  final IconData iconData;
  final double iconSize;
  final Color? iconColor;
  final Color? buttonColor;
  final Color hoverButtonColor;
  final Color? hoverTextColor;
  final VoidCallback? onPressed;

  @override
  SocialButton2State createState() => SocialButton2State();
}

class SocialButton2State extends State<SocialButton2>
    with SingleTickerProviderStateMixin {
  bool _isHovering = false;
  late AnimationController controller;
  late Animation<Color?> animation;
  late Color? startColor;
  late Color? targetColor;

  @override
  void initState() {
    super.initState();
    startColor = widget.titleColor;
    targetColor = widget.hoverTextColor;

    controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    animation = ColorTween(
      begin: startColor,
      end: targetColor,
    ).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              width: widget.buttonWidth,
              height: widget.buttonHeight,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOut,
              decoration: BoxDecoration(
                  color: _isHovering
                      ? widget.hoverButtonColor
                      : widget.buttonColor,
                  borderRadius: const BorderRadius.all(Radius.circular(4))),
              child: MaterialButton(
                onPressed: widget.onPressed,
                child: Icon(
                  widget.iconData,
                  size: widget.iconSize,
                  color: _isHovering ? widget.buttonColor : widget.iconColor,
                ),
              ),
            ),
            const SpaceW12(),
            Text(
              widget.title,
              style: widget.titleStyle ??
                  textTheme.titleSmall?.copyWith(
                    fontSize: Sizes.textSize13,
                    color: animation.value,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  void _mouseEnter(bool hovering) {
    if (hovering) {
      setState(() {
        controller.forward();
        _isHovering = hovering;
      });
    } else {
      setState(() {
        startColor = widget.hoverTextColor;
        targetColor = widget.titleColor;
        _isHovering = hovering;
        controller.reset();
        controller.forward();
      });
    }
  }
}
