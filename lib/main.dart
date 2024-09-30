import 'package:flutter/material.dart';
import 'package:pdax_exam/controller/person_list_controller.dart';
import 'package:pdax_exam/view/person_list_view.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final PersonListController controller = PersonListController();

  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    controller.fetchPeople(10);
    return SafeArea(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.green,
              title: const Text(
                "People",
                style: TextStyle(color: Colors.white),
              )),
          body: PersonListView(controller: controller),
        ),
      ),
    );
  }
}
