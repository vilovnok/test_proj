import 'package:flutter/material.dart';
import 'package:vot/ex/screens/screen_1.dart';
import 'package:vot/sugg_api/suggestions.dart';

import 'ex/screens/screen_2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//

//
//

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<SuggList>? suggestionList;

  @override
  void initState() {
    suggestionList = getDataSugg();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<SuggList>(
          future: suggestionList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.suggestions.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        children: [
                          Text(
                              "${snapshot.data?.suggestions[index].author!['full_name']}"),
                          // Text(list_em[index])
                        ],
                      ),
                    );
                  });
            } else {
              return Text('data');
            }
          }),
    );
  }
}
