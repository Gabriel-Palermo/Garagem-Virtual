import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/car.dart';
import '../providers/car_provider.dart';

class CarDetailsPage extends StatelessWidget {
  final Car car;

  const CarDetailsPage({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    final carProvider = context.watch<CarProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes do veículo')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.directions_car, size: 100, color: Colors.red),

            const SizedBox(height: 24),

            Text(
              car.name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 24),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.business, color: Colors.red),
                      title: const Text(
                        'Marca',
                        style: TextStyle(color: Colors.white70),
                      ),
                      subtitle: Text(
                        car.brand,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),

                    ListTile(
                      leading: const Icon(
                        Icons.calendar_today,
                        color: Colors.red,
                      ),
                      title: const Text(
                        'Ano',
                        style: TextStyle(color: Colors.white70),
                      ),
                      subtitle: Text(
                        car.year.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),

                    ListTile(
                      leading: const Icon(Icons.settings, color: Colors.red),
                      title: const Text(
                        'Motor',
                        style: TextStyle(color: Colors.white70),
                      ),
                      subtitle: Text(
                        car.engine,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                carProvider.toggleFavorite(car);
              },
              icon: Icon(car.isFavorite ? Icons.flag : Icons.flag_outlined),
              label: Text(
                car.isFavorite
                    ? 'Remover dos favoritos'
                    : 'Adicionar aos favoritos',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
