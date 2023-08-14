import 'package:flutter/material.dart';

class Leaderboards extends StatefulWidget {
  const Leaderboards({super.key, required String title});

  @override
  State<Leaderboards> createState() => _LeaderboardsState();
}

class _LeaderboardsState extends State<Leaderboards> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Leaderboard page"),
    );
  }
}
