import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Development1GIPage extends StatefulWidget {
  const Development1GIPage({super.key});

  @override
  State<Development1GIPage> createState() => _Development1GIPageState();
}

class _Development1GIPageState extends State<Development1GIPage> {
  List<Map<String, dynamic>> data = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
      final String response = await rootBundle.loadString(
        'assets/data/development/notes/development1_gi_study.json',
      );

      final List<dynamic> decoded = json.decode(response);
      setState(() {
        data = decoded.cast<Map<String, dynamic>>();
      });
    } catch (e) {
      // Handle JSON or asset loading errors
      debugPrint('Error loading JSON: $e');
    }
  }

  /// Builds a table from plain text content with lines split by "—"
  Widget _buildTableFromContent(String content) {
    final List<String> lines = content.split('\n');

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Table(
        border: TableBorder.all(color: Colors.grey),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: const {
          0: IntrinsicColumnWidth(),
          1: IntrinsicColumnWidth(),
          2: IntrinsicColumnWidth(),
        },
        children: [
          // Header Row
          const TableRow(
            decoration: BoxDecoration(color: Color(0xFFE0E0E0)),
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "संविधान",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "घोषणा मिति",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "घोषणाकर्ता",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          // Data Rows
          ...lines.map((line) {
            final parts = line.split('—');
            if (parts.length < 3) {
              return TableRow(
                children: List.generate(3, (_) => const SizedBox()),
              );
            }
            return TableRow(
              children: parts
                  .take(3)
                  .map(
                    (part) => Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(part.trim()),
                    ),
                  )
                  .toList(),
            );
          }),
        ],
      ),
    );
  }

  /// Builds all sections (paragraphs or tables)
  List<Widget> _buildSections(List<dynamic>? sections) {
    if (sections == null) return [];
    return sections.map<Widget>((sectionRaw) {
      final section = Map<String, dynamic>.from(sectionRaw);
      switch (section['type']) {
        case 'paragraph':
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              section['content'] ?? '',
              style: const TextStyle(fontSize: 14),
            ),
          );
        case 'table':
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: _buildTable(section),
          );
        case 'text_table':
          // Optional: handle table in text format
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: _buildTableFromContent(section['content'] ?? ''),
          );
        default:
          return const SizedBox();
      }
    }).toList();
  }

  /// Builds a DataTable from structured JSON
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
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          headingRowColor: WidgetStateProperty.all(Colors.grey.shade300),
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        title: const Text("General Information"),
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
                          item['title'] ?? '',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
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
