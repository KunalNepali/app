import 'package:app/screens/world_news_quiz_page1.dart';
import 'package:app/screens/world_news_quiz_page2.dart';
import 'package:flutter/material.dart';

class WorldNewsQuizPartPage extends StatelessWidget {
  const WorldNewsQuizPartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        title: const Text("World News Quiz"),
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
                    builder: (context) => const WorldNewsQuizPage1(),
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
                    builder: (context) => const WorldNewsQuizPage2(),
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

  const StudyCard({Key? key, required this.title, required this.content})
    : super(key: key);

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
