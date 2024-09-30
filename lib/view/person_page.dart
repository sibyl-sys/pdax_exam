import 'package:flutter/material.dart';
import 'package:pdax_exam/model/person.dart';
import 'package:intl/intl.dart';

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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(person.imgURL, width: 100, height: 100),
              ],
            ),
            Text("id: ${person.id}"),
            Text("First Name: ${person.firstName}"),
            Text("Last Name: ${person.lastName}"),
            Text("Email: ${person.email}"),
            Text("Phone: ${person.phone}"),
            Text("Birthday: ${DateFormat.yMMMd().format(person.birthday)}"),
            Text("Gender: ${person.gender}"),
            Text("Address: ${person.address.toString()}"),
            Text("Website: ${person.website}"),
          ]),
        ),
      ),
    );
  }
}
