import 'package:flutter/material.dart';
import 'package:pdax_exam/controller/person_list_controller.dart';
import 'package:pdax_exam/view/person_list_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => PersonListController(), child: MainApp()));
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PersonListController>().initializePeople();
    return SafeArea(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.green,
              title: const Text(
                "People",
                style: TextStyle(color: Colors.white),
              )),
          body: PersonListView(),
        ),
      ),
    );
  }
}
