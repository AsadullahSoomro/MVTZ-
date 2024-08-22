import 'package:flutter/material.dart';

class RoadmapScreen extends StatelessWidget {
  const RoadmapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Roadmap'),
        backgroundColor: const Color(0xFF4A148C), // Matches the theme of the main app
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildRoadmapItem(
              'Phase 1: Wallet Integration',
              'Integrate wallet functionalities including registration and transactions.',
              Icons.account_balance_wallet,
            ),
            const SizedBox(height: 20),
            _buildRoadmapItem(
              'Phase 2: Public Sale',
              'Launch the public sale and allow users to purchase tokens.',
              Icons.monetization_on,
            ),
            const SizedBox(height: 20),
            _buildRoadmapItem(
              'Phase 3: Community Engagement',
              'Engage the community through tasks, games, and referral programs.',
              Icons.people,
            ),
            const SizedBox(height: 20),
            _buildRoadmapItem(
              'Phase 4: App Launch',
              'Launch the full version of the app with all features activated.',
              Icons.rocket_launch,
            ),
            const SizedBox(height: 20),
            _buildRoadmapItem(
              'Phase 5: Continuous Updates',
              'Ongoing updates and improvements based on user feedback.',
              Icons.update,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoadmapItem(String title, String description, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFDDCB11), Color(0xFFB5B5B5)], // Gradient to match the theme
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            offset: Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 48,
            color: Colors.black87,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: 'Montserrat',
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}