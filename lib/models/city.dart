class City {
  final String country;
  final String capital;

  City({required this.country, required this.capital});

  factory City.fromJson(Map<String, dynamic> json) {
    return new City(
      country: json['country'] as String,
      capital: json['capital'] as String
    );
  }
}