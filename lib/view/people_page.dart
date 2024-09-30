import 'package:flutter/material.dart';
import 'package:pdax_exam/controller/person_list_controller.dart';
import 'package:pdax_exam/view/person_list_view.dart';
import 'package:provider/provider.dart';

class PeoplePage extends StatelessWidget {
  const PeoplePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PersonListController>().initializePeople();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green,
            title: const Text(
              "People",
              style: TextStyle(color: Colors.white),
            )),
        body: const PersonListView(),
      ),
    );
  }
}
