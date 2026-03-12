import 'package:app/features/development/presentation/development_page.dart';
import 'package:app/features/environment/presentation/environment_page.dart';
import 'package:app/features/genetics/presentation/genetics_page.dart';
import 'package:app/features/geography/presentation/geography_overview_page.dart';
import 'package:app/features/history/presentation/history_study_mcq_page.dart';
import 'package:app/features/nepal_police/presentation/nepal_pol_page.dart';
import 'package:app/features/organization/presentation/organization_page.dart';
import 'package:app/features/technology/presentation/technology_page.dart';
import 'package:app/features/un/presentation/un_page.dart';
import 'package:app/features/world_news/presentation/world_news_page.dart';
import 'package:app/features/constitution/presentation/constitution_page.dart'
    as constitution;
import 'package:flutter/material.dart';

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
      HomeItem(
        title: "UN",
        subtitle: "UN related Missions",
        icon: "assets/icons/un.png",
      ),
      HomeItem(
        title: "Institution",
        subtitle: "saarc, interpole, nato",
        icon: "assets/icons/saarc.png",
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
            MaterialPageRoute(
              builder: (context) => const GeographyOverviewPage(),
            ),
          );
        }
        if (item.title == "History") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HistoryStudyMcqPage(),
            ),
          );
        }
        if (item.title == "Nepal Police") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NepalPolPage()),
          );
        }
        if (item.title == "Constitution") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const constitution.ConstitutionPage(),
            ),
          );
        }
        if (item.title == "Genetics") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const GeneticsPage()),
          );
        }
        if (item.title == "Institution") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const OrganizationPage()),
          );
        }
        if (item.title == "World News") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const WorldNewsPage()),
          );
        }
        if (item.title == "Technology") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TechnologyPage()),
          );
        }
        if (item.title == "UN") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const UNPage()),
          );
        }
        if (item.title == "Development") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DevelopmentPage()),
          );
        }
        if (item.title == "Environment") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const EnvironmentPage()),
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
