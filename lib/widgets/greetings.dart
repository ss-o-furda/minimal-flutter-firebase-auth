import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Greetings extends StatelessWidget {
  final String page;
  const Greetings({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    if (page == 'login') {
      return Column(
        children: [
          const Icon(Icons.lock, size: 100.0),
          const SizedBox(height: 75.0),
          Text(
            'Hello again!',
            style: GoogleFonts.bebasNeue(
              fontSize: 52,
            ),
          ),
          const SizedBox(height: 10.0),
          const Text(
            'Welcome back, you\'we been missed!',
            style: TextStyle(fontSize: 20),
          ),
        ],
      );
    } else if (page == 'register') {
      return Column(
        children: [
          const Icon(Icons.waving_hand_rounded, size: 50.0),
          const SizedBox(height: 25.0),
          // Hello again
          Text(
            'Hello there!',
            style: GoogleFonts.bebasNeue(
              fontSize: 52,
            ),
          ),
          const SizedBox(height: 10.0),
          const Text(
            'Register below with your details!',
            style: TextStyle(fontSize: 20),
          ),
        ],
      );
    }
    return const Placeholder();
  }
}
