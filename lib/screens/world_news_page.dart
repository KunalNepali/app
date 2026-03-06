import 'package:app/screens/world_news_gi_study_pt1.dart';
import 'package:app/screens/world_news_quiz_page.dart';
import 'package:flutter/material.dart';

class WorldNewsPage extends StatelessWidget {
  const WorldNewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        title: const Text("World News"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),

            // Study Button
            buildOptionCard(
              context,
              title: "Study",
              subtitle: "Read notes on Current Affairs",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WorldNews1GIPage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            // MCQ Quiz Button
            buildOptionCard(
              context,
              title: "MCQ Quiz",
              subtitle: "Practice objective questions",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WorldNewsQuizPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOptionCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(subtitle, style: const TextStyle(color: Colors.black54)),
          ],
        ),
      ),
    );
  }
}
