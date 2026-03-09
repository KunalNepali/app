import 'package:app/features/constitution/presentation/constitution_anusuchi_study.dart';
import 'package:flutter/material.dart';
import 'constitution_gi_study.dart';

class ConstitutionStudyPage extends StatelessWidget {
  const ConstitutionStudyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        title: const Text("Constitution Study"),
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
                    builder: (context) => const ConstitutionGIPage(),
                  ),
                );
              },
              child: const StudyCard(
                title: "संविधान: भाग, लेखन समिति, अनुसूची र विषयहरू",
                content:
                    "हालसम्म नेपालमा जारी भएका संविधानहरू, नेपालको संविधान लेखन समितिः अध्यक्ष र सदस्य सचिव, नेपालको वर्तमान संविधान : भाग र विषयहरु, नेपालको वर्तमान संविधान : अनुसूची र विषयहरु",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ConstitutionAnusuchiPage(),
                  ),
                );
              },
              child: const StudyCard(
                title: "अनुसूची",
                content: "अनुसूची १ - ९",
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
