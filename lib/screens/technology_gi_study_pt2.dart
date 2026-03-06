import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Technology2GIPage extends StatefulWidget {
  const Technology2GIPage({Key? key}) : super(key: key);

  @override
  State<Technology2GIPage> createState() => _Technology2GIPageState();
}

class _Technology2GIPageState extends State<Technology2GIPage> {
  List<Map<String, dynamic>> data = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
      final String response = await rootBundle.loadString(
        'assets/data/technology2_gi_study.json',
      );

      final List<dynamic> decoded = json.decode(response);

      setState(() {
        data = decoded.cast<Map<String, dynamic>>();
      });
    } catch (e) {
      debugPrint('Error loading JSON: $e');
    }
  }

  // ---------------- TABLE RENDERER ----------------

  Widget _buildTable(Map<String, dynamic> section) {
    final List<String> headers = List<String>.from(section['headers'] ?? []);
    final List<List<String>> rows = List<List<String>>.from(
      (section['rows'] ?? []).map<List<String>>(
        (row) => List<String>.from(row),
      ),
    );

    if (headers.isEmpty || rows.isEmpty) {
      return const SizedBox();
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingRowColor: MaterialStateProperty.all(Colors.grey.shade200),
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

  // ---------------- IMAGE RENDERER ----------------

  Widget _buildImage(Map<String, dynamic> section) {
    final String? imagePath = section['path'];
    final String? caption = section['caption'];

    if (imagePath == null || imagePath.isEmpty) {
      return const SizedBox();
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => Dialog(
                  insetPadding: const EdgeInsets.all(12),
                  child: InteractiveViewer(child: Image.asset(imagePath)),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "Image not found",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ),
          ),
          if (caption != null && caption.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                caption,
                style: const TextStyle(
                  fontSize: 13,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );
  }

  // ---------------- UNIVERSAL SECTION BUILDER ----------------

  List<Widget> _buildSections(List<dynamic>? sections) {
    if (sections == null) return [];

    return sections.map<Widget>((sectionRaw) {
      final section = Map<String, dynamic>.from(sectionRaw);

      switch (section['type']) {
        case 'heading':
          return Padding(
            padding: const EdgeInsets.only(top: 18, bottom: 10),
            child: Text(
              section['content'] ?? '',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
          final rawItems = section['items'] as List? ?? [];
          final items = rawItems.map<String>((item) {
            if (item is String) return item; // simple string item
            if (item is Map<String, dynamic>) {
              // combine name + jurisdiction for display
              final name = item['name'] ?? '';
              final jurisdiction = item['jurisdiction'] ?? '';
              return jurisdiction.isNotEmpty ? '$name: $jurisdiction' : name;
            }
            return '';
          }).toList();

          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(items.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "(${index + 1}) ",
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

        case 'image':
          return _buildImage(section);

        default:
          return const SizedBox();
      }
    }).toList();
  }

  // ---------------- MAIN BUILD ----------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      appBar: AppBar(
        title: const Text("अनुसूची अध्ययन"),
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
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 3),
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
