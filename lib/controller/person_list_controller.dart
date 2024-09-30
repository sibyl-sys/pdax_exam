import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pdax_exam/model/person.dart';
import 'package:http/http.dart' as http;

class PersonListController extends ChangeNotifier {
  List<Person> people = [];
  int refreshCount = 0;
  int refreshLimit = 4;

  void initializePeople() {
    if (people.isEmpty) {
      fetchPeople(10);
    }
  }

  void fetchPeople(
    int qty,
  ) async {
    print("Loading people");
    if (refreshCount > refreshLimit) return;
    var url = Uri.https(
        "fakerapi.it", "/api/v2/persons", {'quantity': qty.toString()});
    final headers = {
      'Content-Type': 'application/json',
    };
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final Map<String, dynamic> json =
          jsonDecode(Utf8Decoder().convert(response.body.codeUnits));
      final List peopleData = json["data"];
      for (var person in peopleData) {
        people.add(Person(person["firstname"] + " " + person["lastname"],
            person["email"], person["image"]));
      }
    } else {
      throw Exception("Failed to load people");
    }
    refreshCount++;
    notifyListeners();
  }
}
