import 'package:flutter/material.dart';
import 'package:deeps_website/values/values.dart';

class DeepsWebsiteVerticalDivider extends StatelessWidget {
  const DeepsWebsiteVerticalDivider({
    super.key,
    this.thickness = 0.8,
    this.width,
    this.color = AppColors.black,
  });

  final double? width;
  final double thickness;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return VerticalDivider(thickness: thickness);
  }
}
