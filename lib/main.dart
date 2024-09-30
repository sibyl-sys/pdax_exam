import 'package:flutter/material.dart';
import 'package:pdax_exam/controller/person_list_controller.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final PersonListController controller = PersonListController();

  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    controller.fetchPeople(10);
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
