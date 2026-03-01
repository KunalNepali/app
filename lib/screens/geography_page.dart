import 'package:flutter/material.dart';
import 'quiz_page.dart';

class GeographyPage extends StatelessWidget {
  const GeographyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<GeoItem> items = [
      GeoItem("Location", "assets/icons/location.png"),
      GeoItem("Climate", "assets/icons/climate.png"),
      GeoItem("Mountain\nRanges", "assets/icons/mountain.png"),
      GeoItem("Rivers and Streams", "assets/icons/river.png"),
      GeoItem("Lakes and Ponds", "assets/icons/lake.png"),
      GeoItem("Forests", "assets/icons/forest.png"),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        title: const Text("Geography"),
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
            return GeoCard(item: items[index]);
          },
        ),
      ),
    );
  }
}

class GeoCard extends StatelessWidget {
  final GeoItem item;

  const GeoCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (item.title == "Location") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const QuizPage()),
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

class GeoItem {
  final String title;
  final String icon;

  GeoItem(this.title, this.icon);
}
