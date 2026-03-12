import 'package:app/features/geography/presentation/geography_part_notes_page.dart';
import 'package:app/features/geography/presentation/geography_study_page.dart';
import 'package:flutter/material.dart';

class GeographyOverviewPage extends StatelessWidget {
  const GeographyOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        title: const Text("Geography"),
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
              subtitle: "Read Geography notes",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GeographyNotesPageOverview(),
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
                    builder: (context) => const GeographyMcqPage(),
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
