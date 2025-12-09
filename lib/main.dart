import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parkazoop/presentation/screens/login.dart';
import 'presentation/screens/login_screen.dart';
import 'presentation/screens/home_screen.dart';
import 'presentation/screens/available_spots_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Azoop Parking',
      theme: ThemeData(useMaterial3: true),
      initialRoute: '/',
      routes: {
        '/': (_) => const SignInScreen(),
        '/home': (_) => const HomeScreen(),
        '/spots': (_) => const AvailableSpotsScreen(),
        // add more routes: /create-spot, /health, /spot/:id (use onGenerateRoute for param)
      },
    );
  }
}
