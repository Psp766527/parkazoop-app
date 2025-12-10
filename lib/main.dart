import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parkazoop/presentation/screens/user/login.dart';
import 'package:parkazoop/presentation/screens/parking/lot/view/parking_lot_screen.dart';
import 'presentation/screens/user/login_screen.dart';
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
        '/spots': (_) => const Parking3DScreen(),
        // add more routes: /create-spot, /health, /spot/:id (use onGenerateRoute for param)
      },
    );
  }
}
