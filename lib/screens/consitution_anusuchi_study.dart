import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConstitutionAnusuchiPage extends StatefulWidget {
  const ConstitutionAnusuchiPage({Key? key}) : super(key: key);

  @override
  State<ConstitutionAnusuchiPage> createState() => _ConstitutionAnusuchiPage();
}

class _ConstitutionAnusuchiPage extends State<ConstitutionAnusuchiPage> {
  List data = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final String response = await rootBundle.loadString(
      'assets/data/constitution_anusuchi_study.json',
    );

    final decoded = json.decode(response);

    setState(() {
      data = decoded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        title: const Text("अनुसूची"),
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
                          data[index]['title'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(data[index]['content']),
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}
