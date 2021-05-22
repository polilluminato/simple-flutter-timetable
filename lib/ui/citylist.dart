import 'package:flutter/material.dart';
import '../models/city.dart';

class CityList extends StatelessWidget {
  final List<City> citylist;
  CityList({required this.citylist}) : super();

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: citylist.length,
      itemBuilder: (BuildContext context, int index) {
        return new Card(
          child: new Container(
            child: new Center(
                child: new Column(
              // Stretch the cards in horizontal axis
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new Text(
                  citylist[index].country,
                  style: new TextStyle(
                      fontSize: 20.0, color: Colors.lightBlueAccent),
                ),
                new Text(
                  // Read the name field value and set it in the Text widget
                  "Capital:- " + citylist[index].capital,
                  // set some style to text
                  style: new TextStyle(fontSize: 20.0, color: Colors.amber),
                ),
              ],
            )),
            padding: const EdgeInsets.all(15.0),
          ),
        );
      },
    );
  }
}
