import 'package:app/features/world_news/presentation/world_news_gi_study_pt1.dart';
import 'package:app/features/world_news/presentation/world_news_gi_study_pt2.dart';
import 'package:flutter/material.dart';

class WorldNewsStudyPage extends StatelessWidget {
  const WorldNewsStudyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        title: const Text("World News Study"),
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
                    builder: (context) => const WorldNews1GIPage(),
                  ),
                );
              },
              child: const StudyCard(title: "Part 1", content: "Part-1 Notes"),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WorldNews2GIPage(),
                  ),
                );
              },
              child: const StudyCard(title: "Part - 2 ", content: "Part - 2"),
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
