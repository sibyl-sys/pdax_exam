import 'package:flutter/material.dart';
import 'package:pdax_exam/controller/person_list_controller.dart';
import 'package:pdax_exam/view/people_page.dart';
import 'package:pdax_exam/view/person_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => PersonListController(),
      child: MaterialApp(initialRoute: '/', routes: {
        '/': (context) => const PeoplePage(),
        '/person': (context) => const PersonPage()
      })));
}
