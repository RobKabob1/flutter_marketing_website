import 'package:flutter/material.dart';

class Market extends StatefulWidget {
  const Market({super.key, required String title});

  @override
  State<Market> createState() => _MarketState();
}

class _MarketState extends State<Market> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Market page"),
    );
  }
}
