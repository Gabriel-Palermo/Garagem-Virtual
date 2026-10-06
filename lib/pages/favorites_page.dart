import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/car_provider.dart';
import 'car_details_page.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final carProvider = context.watch<CarProvider>();
    final favorites = carProvider.favoriteCars;

    return Scaffold(
      appBar: AppBar(title: const Text('Carros Favoritos')),
      body: Column(
        children: [
          Expanded(
            child: favorites.isEmpty
                ? const Center(
                    child: Text(
                      'Nenhum carro favorito.',
                      style: TextStyle(fontSize: 18, color: Colors.white70),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: favorites.length,
                    itemBuilder: (context, index) {
                      final car = favorites[index];

                      return Card(
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CarDetailsPage(car: car),
                              ),
                            );
                          },
                          leading: const Icon(
                            Icons.directions_car,
                            size: 40,
                            color: Colors.red,
                          ),
                          title: Text(
                            car.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Text(
                            '${car.brand} • ${car.year} • Motor ${car.engine}',
                            style: const TextStyle(color: Colors.white70),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.flag, color: Colors.red),
                            onPressed: () {
                              carProvider.toggleFavorite(car);
                            },
                          ),
                        ),
                      );
                    },
                  ),
          ),

          // Barra de total
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
            decoration: const BoxDecoration(color: Colors.red),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Total de carros favoritos',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(width: 16),

                Container(width: 35, height: 2, color: Colors.white),

                const SizedBox(width: 16),

                Text(
                  '${favorites.length}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
