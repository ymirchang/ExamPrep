import 'package:flutter/material.dart';
import '../database_helper.dart';

class NewCard extends StatelessWidget {
  final String topicName;
  final int topicId;

  const NewCard({super.key, required this.topicName, required this.topicId});

  @override
  Widget build(BuildContext context) {
    TextEditingController _questionController = TextEditingController();
    TextEditingController _answerController = TextEditingController();

    final dbHelper = DatabaseHelper();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          topicName,
          style: const TextStyle(color: Color(0xFFEEEEEE)),
        ),
        backgroundColor: const Color(0xFF31363F),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20),
            child: TextField(
              controller: _questionController,
              autofocus: true,
              decoration: const InputDecoration(labelText: 'Question'),
              minLines: 1,
              maxLines: null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20),
            child: TextField(
              controller: _answerController,
              autofocus: true,
              decoration: const InputDecoration(labelText: 'Answer'),
              minLines: 1,
              maxLines: null,
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              String question = _questionController.text;
              String answer = _answerController.text;

              if (question.isNotEmpty && answer.isNotEmpty) {
                await dbHelper.insertFlashcard(topicId, question, answer);
                _questionController.clear();
                _answerController.clear();
                Navigator.pop(context);
              }
            },
            child: const Text('Add Flashcard'),
          ),
        ],
      ),
    );
  }
}
