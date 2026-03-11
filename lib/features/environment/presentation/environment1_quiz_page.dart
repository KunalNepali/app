import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Environment1QuizPage extends StatefulWidget {
  const Environment1QuizPage({super.key});

  @override
  State<Environment1QuizPage> createState() => _Environment1QuizPageState();
}

class _Environment1QuizPageState extends State<Environment1QuizPage> {
  List questions = [];
  int currentIndex = 0;
  int? selectedIndex;
  bool answered = false;

  int score = 0;
  Timer? timer;
  int remainingSeconds = 59;

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future<void> loadQuestions() async {
    final String response = await rootBundle.loadString(
      'assets/data/environment/quiz/environment1_questions.json',
    );
    final data = json.decode(response);

    setState(() {
      questions = data;
    });

    startTimer();
  }

  void startTimer() {
    remainingSeconds = 59;
    timer?.cancel();

    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;
        });
      } else {
        t.cancel();
        autoNext();
      }
    });
  }

  void selectOption(int index) {
    if (answered) return;

    setState(() {
      selectedIndex = index;
      answered = true;

      if (index == questions[currentIndex]['correctIndex']) {
        score++;
      }
    });

    timer?.cancel();

    Future.delayed(const Duration(seconds: 1), () {
      nextQuestion();
    });
  }

  Color getOptionColor(int index) {
    if (!answered) return Colors.grey.shade300;

    int correct = questions[currentIndex]['correctIndex'];

    if (index == correct) {
      return Colors.green;
    } else if (index == selectedIndex) {
      return Colors.red;
    } else {
      return Colors.grey.shade300;
    }
  }

  void autoNext() {
    if (!answered) {
      setState(() {
        answered = true;
      });
    }

    Future.delayed(const Duration(seconds: 1), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (currentIndex < questions.length - 1) {
      setState(() {
        currentIndex++;
        selectedIndex = null;
        answered = false;
      });
      startTimer();
    } else {
      showResult();
    }
  }

  void previousQuestion() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
        selectedIndex = null;
        answered = false;
      });
      startTimer();
    }
  }

  void showResult() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: const Text("Quiz Completed"),
        content: Text("Your Score: $score / ${questions.length}"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text("Back"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    var question = questions[currentIndex];

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        title: const Text("ASI - I Paper"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Question indicator
            Text(
              "Question ${currentIndex + 1} / ${questions.length}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            // Score display
            Text(
              "Score: $score",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            // Category title
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "UN General Knowledge",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 25),

            // Question text
            Text(
              question['question'],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 25),

            // Options
            Expanded(
              child: GridView.builder(
                itemCount: question['options'].length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 2.5,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => selectOption(index),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: getOptionColor(index),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        "${String.fromCharCode(65 + index)}. ${question['options'][index]}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Countdown
            Text(
              "Answer within: $remainingSeconds seconds",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: previousQuestion,
                  child: const Text("← Previous"),
                ),
                ElevatedButton(
                  onPressed: nextQuestion,
                  child: const Text("Next →"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
