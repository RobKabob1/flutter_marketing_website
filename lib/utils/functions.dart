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
