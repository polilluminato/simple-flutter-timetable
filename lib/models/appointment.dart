class Appointment {
  final String day;
  final String time;
  final String type;
  final String title;

  Appointment({required this.day, required this.time, required this.type, required this.title});

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return new Appointment(
      day: json['day'] as String,
      time: json['time'] as String,
      type: json['type'] as String,
      title: json['title'] as String
    );
  }
}