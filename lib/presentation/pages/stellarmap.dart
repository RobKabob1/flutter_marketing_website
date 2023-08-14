import 'package:flutter/material.dart';

class StellarMap extends StatefulWidget {
  const StellarMap({super.key, required String title});

  @override
  State<StellarMap> createState() => _StellarMapState();
}

class _StellarMapState extends State<StellarMap> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Stellar Map page"),
    );
  }
}
