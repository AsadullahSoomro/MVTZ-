import 'package:flutter/material.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Games'),
        backgroundColor: const Color(0xFF4A148C), // Matches the theme of the main app
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              'Choose a Game to Play!',
              style: TextStyle(
                color: Colors.amber,
                fontSize: 24,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView(
                children: [
                  _buildGameOption(
                    context,
                    'Word Puzzle',
                    'Solve the puzzle and earn points!',
                    Icons.text_fields,
                  ),
                  const SizedBox(height: 20),
                  _buildGameOption(
                    context,
                    'Quiz Game',
                    'Test your knowledge and earn points!',
                    Icons.quiz,
                  ),
                  const SizedBox(height: 20),
                  _buildGameOption(
                    context,
                    'Memory Match',
                    'Match the cards and earn points!',
                    Icons.memory,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGameOption(BuildContext context, String title, String subtitle, IconData icon) {
    return GestureDetector(
      onTap: () {
        // TODO: Navigate to the specific game screen when implemented
      },
      child: Container(
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
            Column(
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
                  subtitle,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}