import 'package:app/screens/constitution_page.dart';
import 'package:app/screens/genetics_page.dart';
import 'package:app/screens/history_page.dart';
import 'package:app/screens/nepal_police_quiz.dart';
import 'package:flutter/material.dart';
import 'package:app/screens/geography_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<HomeItem> items = [
      HomeItem(
        title: "Geography",
        subtitle: "Nepal and World",
        icon: "assets/icons/earth.png",
      ),
      HomeItem(
        title: "History",
        subtitle: "Society, war, religion, etc",
        icon: "assets/icons/scroll.png",
      ),
      HomeItem(
        title: "Development",
        subtitle: "Agriculture, industry, etc",
        icon: "assets/icons/dev.png",
      ),
      HomeItem(
        title: "Environment",
        subtitle: "Climate change,\nnational park, etc.",
        icon: "assets/icons/env.png",
      ),
      HomeItem(
        title: "Technology",
        subtitle: "Computer, internet, etc",
        icon: "assets/icons/tech.png",
      ),
      HomeItem(title: "UN", subtitle: "Missions", icon: "assets/icons/un.png"),
      HomeItem(
        title: "Institution",
        subtitle: "saarc, interpole, nato",
        icon: "assets/icons/interpole.png",
      ),
      HomeItem(
        title: "World News",
        subtitle: "Sports, Arts, etc.",
        icon: "assets/icons/info.png",
      ),
      HomeItem(
        title: "Constitution",
        subtitle: "Part 1-5, schedule",
        icon: "assets/icons/const.png",
      ),
      HomeItem(title: "Genetics", subtitle: "", icon: "assets/icons/genes.png"),
      HomeItem(
        title: "Nepal Police",
        subtitle: "Ranks, traffic signs, etc",
        icon: "assets/icons/police.png",
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.85,
          ),
          itemBuilder: (context, index) {
            return HomeCard(item: items[index]);
          },
        ),
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  final HomeItem item;

  const HomeCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (item.title == "Geography") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const GeographyPage()),
          );
        }
        if (item.title == "History") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HistoryPage()),
          );
        }
        if (item.title == "Nepal Police") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NepalPolicePage()),
          );
        }
        if (item.title == "Constitution") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ConstitutionPage()),
          );
        }
        if (item.title == "Genetics") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const GeneticsPage()),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(item.icon, height: 50, width: 50),
            const SizedBox(height: 16),
            Text(
              item.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              item.subtitle,
              style: const TextStyle(fontSize: 13, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeItem {
  final String title;
  final String subtitle;
  final String icon;

  HomeItem({required this.title, required this.subtitle, required this.icon});
}
