import 'package:flutter/material.dart';
import 'package:flutter_football_app/component/item_team.dart';
import 'package:flutter_football_app/data_source.dart';
import 'package:flutter_football_app/model/list_team.dart';
import 'package:flutter_football_app/pages/page_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});
  final String title;
  DataSource dataSource = DataSource();
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ListTeam? _listTeam;

  @override
  void initState() {
    widget.dataSource.fetchTeams().then((value) {
      if (value != null) {
        setState(() {
          _listTeam = value;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
      padding: EdgeInsets.symmetric(vertical: 100, horizontal: 10),
      child: Column(children: [
        Text(
          "Football Team App",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        ItemTeam(listTeam: _listTeam)
      ]),
    )));
  }
}