import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Azoop Parking')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(onPressed: () => Navigator.of(context).pushNamed('/spots'), child: const Text('View Available Spots')),
            const SizedBox(height: 8),
            ElevatedButton(onPressed: () => Navigator.of(context).pushNamed('/create-spot'), child: const Text('Create New Spot')),
            const SizedBox(height: 8),
            ElevatedButton(onPressed: () => Navigator.of(context).pushNamed('/health'), child: const Text('Health Check')),
            // add other buttons for Start/Reserve/My Sessions
          ],
        ),
      ),
    );
  }
}
