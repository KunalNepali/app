import 'package:app/screens/nepal_police_quiz.dart';
import 'package:app/screens/nepal_police_quiz_fourth.dart';
import 'package:app/screens/nepal_police_quiz_second.dart';
import 'package:app/screens/nepal_police_quiz_third.dart';
import 'package:flutter/material.dart';

class NepalPoliceQuizPage extends StatelessWidget {
  const NepalPoliceQuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        title: const Text("Nepal Police Quiz"),
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
                    builder: (context) => const NepalPolicePage(),
                  ),
                );
              },
              child: const StudyCard(
                title: "यातायात व्यवस्था सम्बन्धित",
                content: "Part-1 Quiz",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NepalPolicePage2(),
                  ),
                );
              },
              child: const StudyCard(
                title: "ट्राफिक संकेतहरु",
                content: "Traffic Signs Quiz",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NepalPolicePage3(),
                  ),
                );
              },
              child: const StudyCard(
                title: "नेपाल प्रहरी इतिहास",
                content: "History Quiz",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NepalPolicePage4(),
                  ),
                );
              },
              child: const StudyCard(
                title: "सांगठनिक संरचना ",
                content: "नेपाल प्रहरी संरचना Quiz",
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
