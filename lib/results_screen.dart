import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary/quesitons_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_Answer': questions[i].answers[0],
        'user_Answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final totalQuestionsCount = questions.length;
    final correctQuestionsCount = summaryData.where((data) {
      return data['user_Answer'] == data['correct_Answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "You answered $correctQuestionsCount out of $totalQuestionsCount questions correctly!",
              style: GoogleFonts.goldman(
                color: Colors.green,
                fontSize: 20,
                fontWeight: FontWeight.w200,
              ),
            ),
            SizedBox(height: 40),
            QuestionsSummary(summaryData),
            SizedBox(height: 40),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(foregroundColor: Colors.green),
              icon: Icon(Icons.refresh),
              label: Text("Restart Quiz"),
            ),
          ],
        ),
      ),
    );
  }
}
