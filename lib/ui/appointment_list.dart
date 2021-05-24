import 'package:flutter/material.dart';
import '../models/appointment.dart';
import 'package:intl/intl.dart';

class AppointmentList extends StatelessWidget {
  final List<Appointment> appointments;
  AppointmentList({required this.appointments}) : super();

  String formatDate(String dateToFormat) {
    return DateFormat.yMMMd().format(DateTime.parse(dateToFormat));
  }

  IconData getIconDataFromType(String type){
    IconData thisIconData = Icons.perm_contact_calendar_rounded;
    switch (type) {
      case "relax":
        thisIconData = Icons.face_retouching_natural_rounded;
        break;
      case "study":
        thisIconData = Icons.book_rounded;
        break;
      case "gym":
        thisIconData = Icons.group_work_rounded;
        break;
      case "friends":
        thisIconData = Icons.people_rounded;
        break;
      default:
    }
    return thisIconData;
  }


  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: appointments.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: new ListTile(
            leading: Icon(
              getIconDataFromType(appointments[index].type),
              size: 36,
            ),
            title: Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text(appointments[index].title),
            ),
            subtitle: Text(
                "${formatDate(appointments[index].day)} @ ${appointments[index].time}"),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        );
      },
    );
  }
}
