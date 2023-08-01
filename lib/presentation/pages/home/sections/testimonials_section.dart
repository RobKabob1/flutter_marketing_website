import 'package:flutter/material.dart';
import 'package:deeps_website/presentation/layout/adaptive.dart';
import 'package:deeps_website/presentation/widgets/content_area.dart';
import 'package:deeps_website/presentation/widgets/deeps_website_info_section.dart';
import 'package:deeps_website/values/values.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});
  @override
  Widget build(BuildContext context) {
    double screenWidth = widthOfScreen(context);
    double screenHeight = heightOfScreen(context);
    double contentAreaWidth = screenWidth * 0.8;
    double contentAreaHeight = screenHeight * 1.0;

    return ContentArea(
      width: contentAreaWidth,
      height: contentAreaHeight,
      child: const Row(
        children: [
          Stack(
            children: [
              Card(
                child: DeepsWebsiteInfoSection1(
                  sectionTitle: StringConst.myTestimonials,
                  title1: StringConst.testimonialsSectionTitle,
                  hasTitle2: false,
                  body: StringConst.testimonials1,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
