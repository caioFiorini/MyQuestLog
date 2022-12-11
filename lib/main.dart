import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'Routers/routes.dart';
import 'package:myquestlog/database/dbSupabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://jtfeeqwhxuqxfwjgetze.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imp0ZmVlcXdoeHVxeGZ3amdldHplIiwicm9sZSI6ImFub24iLCJpYXQiOjE2Njc3Nzc2ODAsImV4cCI6MTk4MzM1MzY4MH0.pnqTVIq5ZVGYpgvBbWHRLhpD4984Hnki8F3SdX4FJBw',
  );
  runApp(App());
}

final supabase = Supabase.instance.client;
var userSupabaseId = "";
var userSupabaseLogado = false;
final dbSupabase dbSup = dbSupabase();

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'API Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      routerDelegate: routes.routerDelegate,
      routeInformationParser: routes.routeInformationParser,
      routeInformationProvider: routes.routeInformationProvider,
    );
  }
}
