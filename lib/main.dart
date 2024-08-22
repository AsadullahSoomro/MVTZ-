import 'package:flutter/material.dart';
import 'package:mvtz/referral_screen.dart';
import 'package:mvtz/roadmap_screen.dart';
import 'package:mvtz/task_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'games_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVTZ Mining Bot',
      theme: ThemeData(
        primaryColor: const Color(0xFF4A148C),
        brightness: Brightness.dark,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.white,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(
            color: Colors.white70,
            fontFamily: 'Montserrat',
          ),
        ),
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          buttonColor: Colors.amber,
          splashColor: Colors.amberAccent,
        ),
        iconTheme: const IconThemeData(color: Colors.amberAccent),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  double _points = 39.5;
  static const double dailyLimit = 1000.0;
  int _rechargesLeft = 0; // Example with no recharges left
  bool _showPlusOne = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _loadPoints();

    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: -50).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );
  }

  Future<void> _loadPoints() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _points = prefs.getDouble('points') ?? 0.0;
      _rechargesLeft = prefs.getInt('rechargesLeft') ?? 2;
    });
  }

  Future<void> _savePoints() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('points', _points);
    await prefs.setInt('rechargesLeft', _rechargesLeft);
  }

  void _mineCoin() {
    if (_points + 0.5 <= dailyLimit) {
      setState(() {
        _points += 0.5; // Increment points by 0.5 for mining action
        _showPlusOne = true;
      });
      _animationController.reset();
      _animationController.forward().then((_) {
        setState(() {
          _showPlusOne = false;
        });
      });
      _savePoints(); // Save points after each increment
    } else {
      setState(() {
        _points = dailyLimit; // Cap at the daily limit
      });
      _savePoints(); // Save points even if it's capped
    }
  }

  void _rechargeEnergy() {
    if (_rechargesLeft > 0) {
      setState(() {
        _points = 0.0; // Reset points
        _rechargesLeft--; // Decrease recharge count
      });
      _savePoints();
    }
  }

  // Deduct 1000 points when increasing points

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double logoSize = screenWidth * 0.8;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            ClipOval(
              child: Image.asset(
                'assets/mvtz_logo1.png',
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'MVTZ Mining Bot',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFd4af37), Color(0xff8a6231)], // Dark Green Gradient
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _mineCoin,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: logoSize / 2,
                    backgroundColor: Colors.transparent, // Circle background color
                    child: ClipOval(
                      child: Image.asset(
                        'assets/mvtz_logo.png',
                        width: logoSize,
                        height: logoSize,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  if (_showPlusOne)
                    Positioned(
                      bottom: _animation.value,
                      child: const Text(
                        '+0.5',
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              blurRadius: 10,
                              color: Colors.black,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Points Display with daily limit info and recharge option
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(0, 4),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Points: $_points / $dailyLimit', // Display current points with daily limit
                        style: const TextStyle(
                          color: Colors.yellow,
                          fontSize: 28,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Stack(
                    children: [
                      LinearProgressIndicator(
                        value: _points / dailyLimit,
                        minHeight: 22,
                        backgroundColor: Colors.white30,
                        color: Colors.yellow,
                      ),
                      Positioned(
                        top: 5,
                        left: 10,
                        child: Row(
                          children: [
                            const Icon(Icons.bolt, color: Colors.teal, size: 18),
                            Text(
                              '${_points.toInt()}/$dailyLimit',
                              style: const TextStyle(
                                color: Colors.amber,
                                fontSize: 16,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 10,
                        child: GestureDetector(
                          onTap: _rechargesLeft > 0 ? _rechargeEnergy : null,
                          child: Row(
                            children: [
                              Text(
                                'Increase',
                                style: TextStyle(
                                  color: _rechargesLeft > 0 ? Colors.yellow : Colors.white54,
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.yellow),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Recharges Left: $_rechargesLeft', // Display remaining recharges
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),

            // Options Display with light yellow gradient
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 18,
                mainAxisSpacing: 15,
                childAspectRatio: 1.3,
                children: [
                  _buildOptionCard(
                    'Task',
                    Icons.assignment,
                        () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TaskScreen()),
                    ),
                  ),
                  _buildOptionCard(
                    'Games',
                    Icons.videogame_asset,
                        () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const GamesScreen()),
                    ),
                  ),
                  _buildOptionCard(
                    'Roadmap',
                    Icons.map,
                        () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RoadmapScreen()),
                    ),
                  ),
                  _buildOptionCard(
                    'Referral',
                    Icons.group,
                        () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ReferralScreen()),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to build Option Cards
  Widget _buildOptionCard(String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.amber, Colors.grey],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              offset: Offset(2, 2),
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}