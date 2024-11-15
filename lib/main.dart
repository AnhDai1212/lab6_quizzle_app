import 'package:flutter/material.dart';

void main() {
  runApp(QuizzlerApp());
}

class QuizzlerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Question> questionBank = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    // Thêm các câu hỏi khác ở đây
  ];

  int questionIndex = 0;

  void nextQuestion() {
    setState(() {
      questionIndex = (questionIndex + 1) % questionBank.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quizzler'),
      ),
      body: Column(
        children: [
          Text(
            questionBank[questionIndex].questionText,
            style: TextStyle(fontSize: 20.0),
          ),
          ElevatedButton(
            onPressed: () {
              // Xử lý câu trả lời đúng
              nextQuestion();
            },
            child: Text('True'),
          ),
          ElevatedButton(
            onPressed: () {
              // Xử lý câu trả lời sai
              nextQuestion();
            },
            child: Text('False'),
          ),
        ],
      ),
    );
  }
}

class Question {
  String questionText;
  bool questionAnswer;

  Question(this.questionText, this.questionAnswer);
}