import 'package:flutter/material.dart';
import 'package:pdax_exam/controller/person_list_controller.dart';
import 'package:pdax_exam/view/person_card.dart';
import 'package:provider/provider.dart';

class PersonListView extends StatefulWidget {
  const PersonListView({super.key});

  @override
  State<PersonListView> createState() => _PersonListViewState();
}

class _PersonListViewState extends State<PersonListView> {
  late PersonListController listController;
  final ScrollController _scrollController = ScrollController();

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      listController.startLoading();
      listController.fetchPeople(20);
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
    listController = context.watch<PersonListController>();
    return ListView.builder(
      shrinkWrap: true,
      controller: _scrollController,
      scrollDirection: Axis.vertical,
      itemCount: listController.people.length + 1,
      itemBuilder: (BuildContext ctxt, int index) {
        if (index < listController.people.length) {
          return PersonCard(person: listController.people[index]);
        } else if (listController.isLoading) {
          return const Center(
              child: CircularProgressIndicator(color: Colors.green));
        } else if (listController.refreshCount > listController.refreshLimit) {
          return const Center(child: Text("No more data."));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
