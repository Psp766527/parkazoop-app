import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state/providers.dart';
import '../../data/models/dto/parking_spot_dto.dart';

class AvailableSpotsScreen extends ConsumerStatefulWidget {
  const AvailableSpotsScreen({super.key});

  @override
  ConsumerState<AvailableSpotsScreen> createState() => _AvailableSpotsScreenState();
}

class _AvailableSpotsScreenState extends ConsumerState<AvailableSpotsScreen> {
  final _typeController = TextEditingController();
  final _latController = TextEditingController();
  final _lngController = TextEditingController();
  final _maxDistanceController = TextEditingController();
  final _limitController = TextEditingController();

  Map<String, dynamic> _params = {};

  void _search() {
    final p = <String, dynamic>{};
    if (_typeController.text.isNotEmpty) p['type'] = _typeController.text;
    if (_latController.text.isNotEmpty) p['lat'] = double.tryParse(_latController.text);
    if (_lngController.text.isNotEmpty) p['lng'] = double.tryParse(_lngController.text);
    if (_maxDistanceController.text.isNotEmpty) p['maxDistance'] = double.tryParse(_maxDistanceController.text);
    if (_limitController.text.isNotEmpty) p['limit'] = int.tryParse(_limitController.text);
    setState(() => _params = p);
  }

  @override
  Widget build(BuildContext context) {
    final asyncSpots = ref.watch(availableSpotsProvider(_params));
    return Scaffold(
      appBar: AppBar(title: const Text('Available Spots')),
      body: Column(
        children: [
          // Filters
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                TextField(controller: _typeController, decoration: const InputDecoration(labelText: 'Type (CAR/BIKE/ELECTRIC)')),
                Row(children: [
                  Expanded(child: TextField(controller: _latController, decoration: const InputDecoration(labelText: 'Lat'))),
                  const SizedBox(width: 8),
                  Expanded(child: TextField(controller: _lngController, decoration: const InputDecoration(labelText: 'Lng'))),
                ]),
                Row(children: [
                  Expanded(child: TextField(controller: _maxDistanceController, decoration: const InputDecoration(labelText: 'Max Distance (m)'))),
                  const SizedBox(width: 8),
                  Expanded(child: TextField(controller: _limitController, decoration: const InputDecoration(labelText: 'Limit'))),
                ]),
                ElevatedButton(onPressed: _search, child: const Text('Search')),
              ],
            ),
          ),

          // Results
          Expanded(
            child: asyncSpots.when(
              data: (list) => ListView.separated(
                itemCount: list.length,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (_, i) {
                  final ParkingSpotDto s = list[i];
                  return ListTile(
                    title: Text('${s.spotNumber} — ${s.type.toString().split('.').last}'),
                    subtitle: Text('${s.status.toString().split('.').last} • ${s.hourlyRate.amount} ${s.hourlyRate.currency}'),
                    onTap: () => Navigator.of(context).pushNamed('/spot/${s.id}'),
                  );
                },
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, st) => Center(child: Text('Error: ${err.toString()}')),
            ),
          ),
        ],
      ),
    );
  }
}
