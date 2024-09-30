import 'package:flutter/material.dart';
import 'package:pdax_exam/model/person.dart';

class PersonCard extends StatelessWidget {
  final Person person;
  final int index;
  const PersonCard({super.key, required this.person, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(children: [
      Image.network("https://picsum.photos/100?random=${index.toString()}"),
      Column(
        children: [Text(person.name), Text(person.email)],
      )
    ]));
  }
}
