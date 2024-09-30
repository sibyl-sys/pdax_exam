import 'package:flutter/material.dart';
import 'package:pdax_exam/model/person.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({super.key});

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  @override
  Widget build(BuildContext context) {
    final Person person = ModalRoute.of(context)?.settings.arguments as Person;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green,
            title: Text(
              "${person.firstName} ${person.lastName}",
              style: TextStyle(color: Colors.white),
            )),
        body: const Center(child: Text("Hello World")),
      ),
    );
  }
}
