import 'package:app/features/nepal_police/presentation/nepal_police_gi_study1.dart';
import 'package:app/features/nepal_police/presentation/nepal_police_gi_study2.dart';
import 'package:app/features/nepal_police/presentation/nepal_police_gi_study3.dart';
import 'package:app/features/nepal_police/presentation/nepal_police_gi_study4.dart';
import 'package:app/features/nepal_police/presentation/nepal_police_gi_study5.dart';
import 'package:app/features/nepal_police/presentation/nepal_police_gi_study6.dart';
import 'package:flutter/material.dart';

class NepalPolicePartsStudyPage extends StatelessWidget {
  const NepalPolicePartsStudyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        title: const Text("Nepal Police Study"),
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
                    builder: (context) => const NepalPolice1GIPage(),
                  ),
                );
              },
              child: const StudyCard(
                title: "ऐतिहासिक पृष्ठभूमि",
                content: "UNIT - 1",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NepalPolice2GIPage(),
                  ),
                );
              },
              child: const StudyCard(
                title: " ट्राफिक प्रहरीको इतिहा",
                content: "UNIT - 2",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NepalPolice3GIPage(),
                  ),
                );
              },
              child: const StudyCard(
                title: "संगठनात्मक संरचना",
                content: "UNIT - 3",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NepalPolice4GIPage(),
                  ),
                );
              },
              child: const StudyCard(
                title: "Nepal Police Ranks",
                content: "नेपाल प्रहरी (दर्ज्यानी चिह्न)",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NepalPolice5GIPage(),
                  ),
                );
              },
              child: const StudyCard(
                title: "प्रहरीका प्रदेश कार्यालय",
                content: "UNIT - 5",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NepalPolice6GIPage(),
                  ),
                );
              },
              child: const StudyCard(
                title: "प्रहरीमा पहिलो व्यक्तित्वहरू",
                content: "UNIT - 6",
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
