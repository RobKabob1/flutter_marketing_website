import 'package:deeps_website/presentation/pages/wiki/wiki_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const kDuration = Duration(milliseconds: 600);

Future<void> openUrlLink(String url) async {
  if (await canLaunchUrl(url as Uri)) {
    await launchUrl(
      url as Uri,
    );
  } else {
    throw 'Could not launch $url';
  }
}

scrollToSection(BuildContext context) {
  Scrollable.ensureVisible(
    context,
    duration: kDuration,
  );
}

goToRoute(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const WikiPage(
        title: 'Wiki',
      ),
    ),
  );
}
