import 'dart:convert';

import 'package:flutter/material.dart';

import '../ui/appointment_list.dart';
import '../models/appointment.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Easy Timetable',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        accentColor: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Easy Timetable'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Appointment> parseJson(String response) {
    final parsed =
        json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed.map<Appointment>((json) => new Appointment.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Container(
        child: new Center(
          // Use future builder and DefaultAssetBundle to load the local JSON file
          child: new FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/json/timetable.json'),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return new Center(
                  child: new CircularProgressIndicator(),
                ); // return a loader when there is not data
              } else {
                List<Appointment> appointments = parseJson(snapshot.data.toString());
                return new AppointmentList(
                  appointments: appointments,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
