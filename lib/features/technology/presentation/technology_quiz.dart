import 'package:app/features/technology/presentation/technology1_quiz_page.dart';
import 'package:app/features/technology/presentation/technology2_quiz_page.dart';
import 'package:flutter/material.dart';

class TechnologyQuizPage extends StatelessWidget {
  const TechnologyQuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        title: const Text("Technology Quiz"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Tech1QuizPage(),
                  ),
                );
              },
              child: const StudyCard(title: "Part 1", content: "Part-1 Quiz"),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Tech2QuizPage(),
                  ),
                );
              },
              child: const StudyCard(
                title: "Part - 2",
                content: "Part - 2 Quiz",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StudyCard extends StatelessWidget {
  final String title;
  final String content;

  const StudyCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(content),
        ],
      ),
    );
  }
}
