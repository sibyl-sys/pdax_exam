import 'package:flutter/material.dart';
import 'package:pdax_exam/controller/person_list_controller.dart';
import 'package:pdax_exam/view/person_view.dart';

class PersonListView extends StatefulWidget {
  final PersonListController controller;
  const PersonListView({super.key, required this.controller});

  @override
  State<PersonListView> createState() => _PersonListViewState();
}

class _PersonListViewState extends State<PersonListView> {
  ScrollController _scrollController = ScrollController();

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      widget.controller.fetchPeople(20);
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: widget.controller.people.length,
      itemBuilder: (BuildContext ctxt, int index) {
        return PersonView(
            person: widget.controller.people[index], index: index);
      },
    );
  }
}
