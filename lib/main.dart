import 'package:flutter/material.dart';
import 'services/sports_service.dart';
import 'models/league_model.dart';

void main() => runApp(const SportPulseApp());

class SportPulseApp extends StatelessWidget {
  const SportPulseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF020C1B),
        cardColor: const Color(0xFF112240),
        primaryColor: const Color(0xFF0A192F),
      ),
      home: const LeagueListScreen(),
    );
  }
}

class LeagueListScreen extends StatefulWidget {
  const LeagueListScreen({super.key});
  @override
  State<LeagueListScreen> createState() => _LeagueListScreenState();
}

class _LeagueListScreenState extends State<LeagueListScreen> {
  final SportsService _service = SportsService();
  late Future<List<League>> _leagues;

  @override
  void initState() {
    super.initState();
    _leagues = _service.fetchAllLeagues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SportPulse Ligák")),
      body: FutureBuilder<List<League>>(
        future: _leagues,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(snapshot.data![index].name),
                    subtitle: Text(snapshot.data![index].sport),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
