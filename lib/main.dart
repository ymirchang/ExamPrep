import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'ExamPrep',
      home: Home(),
    ),
  );
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExamPrep'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Checklist(),
      floatingActionButton: AddItem(),
    );
  }
}

class Checklist extends StatefulWidget {
  const Checklist({super.key});

  @override
  State<Checklist> createState() => _ChecklistState();
}

class _ChecklistState extends State<Checklist> {
  List<String> items = [];

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Center(
        child: Text('Please add a topic'),
      );
    } else {
      return ListView.builder(
          itemCount: items.length,
          itemBuilder: ((context, index) {
            return ListTile(
              title: Text(items[index]),
            );
          }));
    }
  }
}

class AddItem extends StatelessWidget {
  const AddItem({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      tooltip: 'Add Item',
      child: Icon(Icons.add),
    );
  }
}
