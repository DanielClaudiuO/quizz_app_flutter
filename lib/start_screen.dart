import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            height: 500,
            color: Color(0X8BC34A00),
          ),
          SizedBox(height: 100),
          Text(
            "Learn Flutter The Fun Way!",
            style: GoogleFonts.goldman(color: Colors.white, fontSize: 24),
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(backgroundColor: Colors.lightGreen),
            icon: Icon(Icons.arrow_right_alt),
            label: Text(
              "Start Quiz",
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}
