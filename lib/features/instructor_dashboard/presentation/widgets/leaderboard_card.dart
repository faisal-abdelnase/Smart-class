import 'package:flutter/material.dart';
import 'package:smart_class/core/utils/extensions.dart';

import 'dashboard_card.dart';
import 'leader_board_tile.dart';

class LeaderboardCard extends StatelessWidget {
  const LeaderboardCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardCard(
      title: context.tr("leaderboard"),
      child: Column(
        children: const [
          LeaderboardTile(
            rank: 1,
            name: "Ahmed Ali",
            score: "98%",
          ),
          SizedBox(height: 14),
          LeaderboardTile(
            rank: 2,
            name: "Sara Mohamed",
            score: "95%",
          ),
          SizedBox(height: 14),
          LeaderboardTile(
            rank: 3,
            name: "Omar Hassan",
            score: "92%",
          ),
        ],
      ),
    );
  }
}

