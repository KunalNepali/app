import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WorldNews1GIPage extends StatefulWidget {
  const WorldNews1GIPage({super.key});

  @override
  State<WorldNews1GIPage> createState() => _WorldNews1GIPageState();
}

class _WorldNews1GIPageState extends State<WorldNews1GIPage> {
  List<Map<String, dynamic>> data = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
      final String response = await rootBundle.loadString(
        'assets/data/world_news/notes/world_news_gi_questions.json',
      );

      final List<dynamic> decoded = json.decode(response);

      setState(() {
        data = decoded.cast<Map<String, dynamic>>();
      });
    } catch (e) {
      debugPrint('Error loading JSON: $e');
    }
  }

  // ---------------- SECTION BUILDER ----------------

  List<Widget> _buildSections(List<dynamic>? sections) {
    if (sections == null) return [];

    return sections.map<Widget>((sectionRaw) {
      final section = Map<String, dynamic>.from(sectionRaw);

      switch (section['type']) {
        case 'heading':
          return Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 10),
            child: Text(
              section['content'] ?? '',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
          );

        case 'paragraph':
          return Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: Text(
              section['content'] ?? '',
              style: const TextStyle(fontSize: 15, height: 1.7),
            ),
          );

        case 'numbered_list':
          final items = List<String>.from(section['items'] ?? []);

          return Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(items.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${index + 1}. ",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Text(
                          items[index],
                          style: const TextStyle(fontSize: 14, height: 1.6),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          );

        case 'table':
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: _buildTable(section),
          );

        default:
          return const SizedBox();
      }
    }).toList();
  }

  // ---------------- TABLE BUILDER ----------------

  Widget _buildTable(Map<String, dynamic> section) {
    final List<String> headers = List<String>.from(section['headers'] ?? []);
    final List<List<String>> rows = List<List<String>>.from(
      (section['rows'] ?? []).map<List<String>>(
        (row) => List<String>.from(row),
      ),
    );

    if (headers.isEmpty || rows.isEmpty) return const SizedBox();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingRowColor: WidgetStateProperty.all(Colors.grey.shade200),
        columns: headers
            .map(
              (header) => DataColumn(
                label: Text(
                  header,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            )
            .toList(),
        rows: rows
            .map(
              (row) => DataRow(
                cells: row.map((cell) => DataCell(Text(cell))).toList(),
              ),
            )
            .toList(),
      ),
    );
  }

  // ---------------- MAIN BUILD ----------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      appBar: AppBar(
        title: const Text("Politics, social events, culture, economy,awards"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: data.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['title'] ?? '',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 14),
                        ..._buildSections(item['sections']),
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}
