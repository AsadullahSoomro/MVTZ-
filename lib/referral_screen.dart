import 'package:flutter/material.dart';

class ReferralScreen extends StatelessWidget {
  const ReferralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Referral Program'),
        backgroundColor: const Color(0xFF4A148C), // Matches the theme of the main app
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildReferralCard(
              referralTitle: 'Refer 10 Friends',
              reward: 'Earn 50 points',
              icon: Icons.group_add,
            ),
            const SizedBox(height: 20),
            _buildReferralCard(
              referralTitle: 'Refer 20 Friends',
              reward: 'Earn 100 points',
              icon: Icons.groups,
            ),
            const SizedBox(height: 40),
            _buildReferralLinkSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildReferralCard({
    required String referralTitle,
    required String reward,
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
                  referralTitle,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: 'Montserrat',
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  reward,
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

  Widget _buildReferralLinkSection() {
    return Column(
      children: [
        const Text(
          'Your Referral Link',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            fontFamily: 'Montserrat',
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 4),
                blurRadius: 5,
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'https://example.com/referral?code=YOURCODE',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    fontFamily: 'Montserrat',
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.copy),
                onPressed: () {
                  // Copy referral link to clipboard
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Share your referral link and earn rewards when your friends sign up!',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white70,
            fontFamily: 'Montserrat',
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

// import 'package:flutter/material.dart';
//
// class ReferralScreen extends StatelessWidget {
//   const ReferralScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: const Text(
//           'Referral Program',
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
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const Text(
//               'Invite your friends and earn rewards!',
//               style: TextStyle(
//                 fontFamily: 'Montserrat',
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 20),
//             _buildReferralCard(
//               context,
//               referralTitle: 'Refer 10 Friends',
//               reward: 'Earn 50 points',
//               onPressed: () {
//                 // Handle referral action here
//               },
//             ),
//             const SizedBox(height: 20),
//             _buildReferralCard(
//               context,
//               referralTitle: 'Refer 20 Friends',
//               reward: 'Earn 100 points',
//               onPressed: () {
//                 // Handle referral action here
//               },
//             ),
//             const SizedBox(height: 40),
//             _buildReferralLinkSection(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildReferralCard(
//       BuildContext context, {
//         required String referralTitle,
//         required String reward,
//         required VoidCallback onPressed,
//       }) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15),
//       ),
//       elevation: 5,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               referralTitle,
//               style: const TextStyle(
//                 fontFamily: 'Montserrat',
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//                 color: Colors.black87,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               reward,
//               style: const TextStyle(
//                 fontFamily: 'Montserrat',
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.green,
//               ),
//             ),
//             const SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: onPressed,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.amber,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               child: const Text(
//                 'Refer Now',
//                 style: TextStyle(
//                   fontFamily: 'Montserrat',
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildReferralLinkSection() {
//     return Column(
//       children: [
//         const Text(
//           'Your Referral Link',
//           style: TextStyle(
//             fontFamily: 'Montserrat',
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//         const SizedBox(height: 10),
//         Container(
//           padding: const EdgeInsets.all(10.0),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(10),
//             boxShadow: const [
//               BoxShadow(
//                 color: Colors.black26,
//                 offset: Offset(0, 4),
//                 blurRadius: 5,
//               ),
//             ],
//           ),
//           child: Row(
//             children: [
//               Expanded(
//                 child: Text(
//                   'https://example.com/referral?code=YOURCODE',
//                   style: const TextStyle(
//                     fontFamily: 'Montserrat',
//                     fontSize: 14,
//                     color: Colors.black87,
//                   ),
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//               IconButton(
//                 icon: const Icon(Icons.copy),
//                 onPressed: () {
//                   // Copy referral link to clipboard
//                 },
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           'Share your referral link and earn rewards when your friends sign up!',
//           style: TextStyle(
//             fontFamily: 'Montserrat',
//             fontSize: 14,
//             color: Colors.white70,
//           ),
//           textAlign: TextAlign.center,
//         ),
//       ],
//     );
//   }
// }
//
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'dart:convert';
// //
// // class ReferralScreen extends StatefulWidget {
// //   const ReferralScreen({super.key});
// //
// //   @override
// //   State<ReferralScreen> createState() => _ReferralScreenState();
// // }
// //
// // class _ReferralScreenState extends State<ReferralScreen> {
// //   final TextEditingController _emailController = TextEditingController();
// //
// //   @override
// //   void dispose() {
// //     _emailController.dispose();
// //     super.dispose();
// //   }
// //
// //   Future<void> sendReferral(String referrerId, String referredEmail) async {
// //     final response = await http.post(
// //       Uri.parse('http://211.132.7.235/referral.php'),
// //       body: {
// //         'referrer_id': referrerId,
// //         'referred_email': referredEmail,
// //       },
// //     );
// //
// //     if (response.statusCode == 200) {
// //       var responseBody = json.decode(response.body);
// //       if (responseBody['status'] == 'success') {
// //         // Handle successful referral
// //         ScaffoldMessenger.of(context).showSnackBar(
// //           const SnackBar(content: Text('Referral sent successfully!')),
// //         );
// //       } else {
// //         // Handle error
// //         ScaffoldMessenger.of(context).showSnackBar(
// //           SnackBar(content: Text('Error: ${responseBody['message']}')),
// //         );
// //       }
// //     } else {
// //       throw Exception('Failed to send referral');
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Invite Friends'),
// //       ),
// //       body: Center(
// //         child: Padding(
// //           padding: const EdgeInsets.all(16.0),
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: <Widget>[
// //               const Text('Invite your friends and earn rewards!'),
// //               TextField(
// //                 controller: _emailController,
// //                 decoration: const InputDecoration(labelText: 'Friend\'s Email'),
// //               ),
// //               const SizedBox(height: 20),
// //               ElevatedButton(
// //                 onPressed: () {
// //                   sendReferral('1', _emailController.text); // Replace '1' with the current user's ID
// //                 },
// //                 child: const Text('Send Invite'),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
