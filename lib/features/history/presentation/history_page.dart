import 'package:app/features/history/presentation/history_quiz_page.dart';
import 'package:flutter/material.dart';

class HistoryMcqPage extends StatelessWidget {
  const HistoryMcqPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<HistoryItem> items = [
      HistoryItem("Ancient & Medieval", "assets/icons/gopal.png"),
      HistoryItem("Modern History", "assets/icons/pns.png"),
      HistoryItem("Wars & Treaties", "assets/icons/war_treaty.png"),
      HistoryItem("Prevalent", "assets/icons/present.png"),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        title: const Text("History Mcq"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            return HistoryCard(item: items[index]);
          },
        ),
      ),
    );
  }
}

class HistoryCard extends StatelessWidget {
  final HistoryItem item;

  const HistoryCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (item.title == "Ancient & Medieval") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HistoryQuizPage()),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(item.icon, height: 60),
            const SizedBox(height: 12),
            Text(
              item.title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

class HistoryItem {
  final String title;
  final String icon;

  HistoryItem(this.title, this.icon);
}
