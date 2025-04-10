import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/state/fetch_result.dart';
import 'package:state_management/state/load_action.dart';
import 'package:state_management/state/persons_bloc.dart';
import 'package:state_management/types/person.dart';
import 'package:state_management/types/persons_url.dart';

extension Subscript<T> on Iterable<T> {
  // Operator overloading
  T? operator [](int index) => length > index ? elementAt(index) : null;
}

Future<Iterable<Person>> getPersons(String url) => HttpClient()
    .getUrl(Uri.parse(url))
    .then((req) => req.close())
    .then((resp) => resp.transform(utf8.decoder).join())
    .then((str) => json.decode(str) as List<dynamic>)
    .then((list) => list.map((e) => Person.fromJson(e)));

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  context.read<PersonsBloc>().add(
                        const LoadPersonsAction(
                          url: persons1Url,
                          loader: getPersons,
                        ),
                      );
                },
                child: const Text('Load json #1'),
              ),
              TextButton(
                onPressed: () {
                  context.read<PersonsBloc>().add(
                        const LoadPersonsAction(
                          url: persons2Url,
                          loader: getPersons,
                        ),
                      );
                },
                child: const Text('Load json #2'),
              ),
            ],
          ),
          BlocBuilder<PersonsBloc, FetchResult?>(
            buildWhen: (previous, current) =>
                previous?.persons != current?.persons,
            builder: (context, state) {
              if (state?.persons == null) return const SizedBox();

              return Expanded(
                child: ListView.builder(
                  itemCount: state?.persons.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(state?.persons[index]?.name ?? ''),
                    subtitle: Text(state?.persons[index]?.age.toString() ?? ''),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
