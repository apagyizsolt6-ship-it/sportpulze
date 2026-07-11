class League {
  final String id;
  final String name;
  final String sport;

  League({required this.id, required this.name, required this.sport});

  factory League.fromJson(Map<String, dynamic> json) {
    return League(
      id: json['idLeague'] ?? '',
      name: json['strLeague'] ?? '',
      sport: json['strSport'] ?? '',
    );
  }
}
