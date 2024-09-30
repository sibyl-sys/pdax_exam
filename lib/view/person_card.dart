import 'package:flutter/material.dart';
import 'package:pdax_exam/model/person.dart';

class PersonCard extends StatelessWidget {
  final Person person;
  final int index;
  const PersonCard({super.key, required this.person, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/person", arguments: person);
      },
      child: Row(children: [
        Image.network("https://i.pravatar.cc/100?random=${index.toString()}",
            width: 100, height: 100),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${person.firstName} ${person.lastName}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Text(person.email)
          ],
        )
      ]),
    ));
  }
}
