import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:favorite_places/providers/user_places.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() {
    return _AddPlaceScreensState();
  }
}

class _AddPlaceScreensState extends ConsumerState<AddPlaceScreen> {
  final _titelControllar = TextEditingController();

  void _savePlace() {
    final entredTitel = _titelControllar.text;

    if (entredTitel.isEmpty) {
      return;
    }

    ref.read(userPlacesProvider.notifier).addPlace(entredTitel);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titelControllar.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new place'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Titel'),
              controller: _titelControllar,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _savePlace,
              icon: const Icon(Icons.add),
              label: const Text('Add place'),
            ),
          ],
        ),
      ),
    );
  }
}
