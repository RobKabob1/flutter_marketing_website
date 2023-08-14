import 'package:flutter/material.dart';

class WikiPage extends StatefulWidget {
  const WikiPage({super.key, required String title});

  @override
  State<WikiPage> createState() => _WikiPageState();
}

class _WikiPageState extends State<WikiPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Wiki page"),
    );
  }
}
