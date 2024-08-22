import 'package:flutter/material.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        backgroundColor: const Color(0xFF4A148C), // Matches the theme of the main app
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildTaskCard(
              taskTitle: 'Follow Us on Twitter',
              taskDescription: 'Earn 10 points by following our Twitter account.',
              points: 10,
              icon: Icons.follow_the_signs,
            ),
            const SizedBox(height: 20),
            _buildTaskCard(
              taskTitle: 'Join Our Telegram Channel',
              taskDescription: 'Earn 15 points by joining our Telegram channel.',
              points: 15,
              icon: Icons.telegram,
            ),
            const SizedBox(height: 20),
            _buildTaskCard(
              taskTitle: 'Like Our Facebook Page',
              taskDescription: 'Earn 10 points by liking our Facebook page.',
              points: 10,
              icon: Icons.facebook,
            ),
            const SizedBox(height: 20),
            _buildTaskCard(
              taskTitle: 'Share Our App',
              taskDescription: 'Earn 20 points by sharing our app with friends.',
              points: 20,
              icon: Icons.share,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskCard({
    required String taskTitle,
    required String taskDescription,
    required int points,
    required IconData icon,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFDDCB11), Color(0xFFB5B5B5)],
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
                  taskTitle,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: 'Montserrat',
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  taskDescription,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    fontFamily: 'Montserrat',
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Earn $points points',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
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

















// import 'package:flutter/material.dart';
//
// class TaskScreen extends StatelessWidget {
//   const TaskScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: const Text(
//           'Tasks',
//           style: TextStyle(
//             fontFamily: 'Montserrat',
//             fontWeight: FontWeight.bold,
//             fontSize: 20,
//           ),
//         ),
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFF004D40), Color(0xFF00796B)], // Dark Green Gradient
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             _buildTaskCard(
//               context,
//               taskTitle: 'Follow Us on Twitter',
//               taskDescription: 'Earn 10 points by following our Twitter account.',
//               points: 10,
//               onPressed: () {
//                 // Handle task completion action here
//               },
//             ),
//             _buildTaskCard(
//               context,
//               taskTitle: 'Join Our Telegram Channel',
//               taskDescription: 'Earn 15 points by joining our Telegram channel.',
//               points: 15,
//               onPressed: () {
//                 // Handle task completion action here
//               },
//             ),
//             _buildTaskCard(
//               context,
//               taskTitle: 'Like Our Facebook Page',
//               taskDescription: 'Earn 10 points by liking our Facebook page.',
//               points: 10,
//               onPressed: () {
//                 // Handle task completion action here
//               },
//             ),
//             _buildTaskCard(
//               context,
//               taskTitle: 'Share Our App',
//               taskDescription: 'Earn 20 points by sharing our app with friends.',
//               points: 20,
//               onPressed: () {
//                 // Handle task completion action here
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTaskCard(
//       BuildContext context, {
//         required String taskTitle,
//         required String taskDescription,
//         required int points,
//         required VoidCallback onPressed,
//       }) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15),
//       ),
//       elevation: 5,
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               taskTitle,
//               style: const TextStyle(
//                 fontFamily: 'Montserrat',
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               taskDescription,
//               style: const TextStyle(
//                 fontFamily: 'Montserrat',
//                 fontSize: 14,
//                 color: Colors.black87,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Earn $points points',
//                   style: const TextStyle(
//                     fontFamily: 'Montserrat',
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.green,
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: onPressed,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.amber,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   child: const Text(
//                     'Complete',
//                     style: TextStyle(
//                       fontFamily: 'Montserrat',
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'dart:convert';
// //
// // class TaskScreen extends StatefulWidget {
// //   const TaskScreen({super.key});
// //
// //   @override
// //   _TaskScreenState createState() => _TaskScreenState();
// // }
// //
// // class _TaskScreenState extends State<TaskScreen> {
// //   Future<List<Task>> fetchTasks() async {
// //     final response = await http.get(Uri.parse('http://211.132.7.235/tasks.php'));
// //
// //     if (response.statusCode == 200) {
// //       List jsonResponse = json.decode(response.body);
// //       return jsonResponse.map((task) => Task.fromJson(task)).toList();
// //     } else {
// //       throw Exception('Failed to load tasks');
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Tasks'),
// //       ),
// //       body: FutureBuilder<List<Task>>(
// //         future: fetchTasks(),
// //         builder: (context, snapshot) {
// //           if (snapshot.hasData) {
// //             List<Task> tasks = snapshot.data!;
// //             return ListView.builder(
// //               itemCount: tasks.length,
// //               itemBuilder: (context, index) {
// //                 return ListTile(
// //                   title: Text(tasks[index].taskName),
// //                   subtitle: Text(tasks[index].taskDescription),
// //                   trailing: Text('Points: ${tasks[index].points}'),
// //                   onTap: () {
// //                     // Handle task tap
// //                   },
// //                 );
// //               },
// //             );
// //           } else if (snapshot.hasError) {
// //             return Text("${snapshot.error}");
// //           }
// //           return const CircularProgressIndicator();
// //         },
// //       ),
// //     );
// //   }
// // }
// //
// // class Task {
// //   final int id;
// //   final String taskName;
// //   final String taskDescription;
// //   final String taskLink;
// //   final int points;
// //
// //   Task({required this.id, required this.taskName, required this.taskDescription, required this.taskLink, required this.points});
// //
// //   factory Task.fromJson(Map<String, dynamic> json) {
// //     return Task(
// //       id: json['id'],
// //       taskName: json['task_name'],
// //       taskDescription: json['task_description'],
// //       taskLink: json['task_link'],
// //       points: json['points'],
// //     );
// //   }
// // }
// //
// // // import 'package:flutter/material.dart';
// // // import 'package:http/http.dart' as http;
// // // import 'dart:convert';
// // //
// // // class TaskScreen extends StatefulWidget {
// // //   const TaskScreen({super.key});
// // //
// // //   @override
// // //   _TaskScreenState createState() => _TaskScreenState();
// // // }
// // //
// // // class _TaskScreenState extends State<TaskScreen> {
// // //   Future<List<Task>> fetchTasks() async {
// // //     final response = await http.get(Uri.parse('http://211.132.7.235/tasks.php'));
// // //
// // //     if (response.statusCode == 200) {
// // //       List jsonResponse = json.decode(response.body);
// // //       return jsonResponse.map((task) => Task.fromJson(task)).toList();
// // //     } else {
// // //       throw Exception('Failed to load tasks');
// // //     }
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text('Tasks'),
// // //       ),
// // //       body: FutureBuilder<List<Task>>(
// // //         future: fetchTasks(),
// // //         builder: (context, snapshot) {
// // //           if (snapshot.hasData) {
// // //             List<Task> tasks = snapshot.data!;
// // //             return ListView.builder(
// // //               itemCount: tasks.length,
// // //               itemBuilder: (context, index) {
// // //                 return ListTile(
// // //                   title: Text(tasks[index].taskName),
// // //                   subtitle: Text(tasks[index].taskDescription),
// // //                   trailing: Text('Points: ${tasks[index].points}'),
// // //                   onTap: () {
// // //                     // Handle task tap
// // //                   },
// // //                 );
// // //               },
// // //             );
// // //           } else if (snapshot.hasError) {
// // //             return Text("${snapshot.error}");
// // //           }
// // //           return const CircularProgressIndicator();
// // //         },
// // //       ),
// // //     );
// // //   }
// // // }
// // //
// // // class Task {
// // //   final int id;
// // //   final String taskName;
// // //   final String taskDescription;
// // //   final String taskLink;
// // //   final int points;
// // //
// // //   Task({required this.id, required this.taskName, required this.taskDescription, required this.taskLink, required this.points});
// // //
// // //   factory Task.fromJson(Map<String, dynamic> json) {
// // //     return Task(
// // //       id: json['id'],
// // //       taskName: json['task_name'],
// // //       taskDescription: json['task_description'],
// // //       taskLink: json['task_link'],
// // //       points: json['points'],
// // //     );
// // //   }
// // // }