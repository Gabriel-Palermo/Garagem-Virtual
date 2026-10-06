import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/car.dart';
import '../providers/car_provider.dart';
import 'favorites_page.dart';
import 'car_details_page.dart';

class GaragePage extends StatelessWidget {
  const GaragePage({super.key});

  @override
  Widget build(BuildContext context) {
    final carProvider = context.watch<CarProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Minha Garagem',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.flag, color: Colors.red),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FavoritesPage()),
              );
            },
          ),
        ],
      ),
      body: carProvider.cars.isEmpty
          ? const Center(
              child: Text(
                'Nenhum carro na garagem.',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: carProvider.cars.length,
              itemBuilder: (context, index) {
                final car = carProvider.cars[index];

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
                      '${car.brand} • ${car.year}',
                      style: const TextStyle(color: Colors.white70),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(
                            car.isFavorite ? Icons.flag : Icons.flag_outlined,
                            color: car.isFavorite ? Colors.red : Colors.white70,
                          ),
                          onPressed: () {
                            carProvider.toggleFavorite(car);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.white70),
                          onPressed: () {
                            carProvider.removeCar(car);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddCarDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddCarDialog(BuildContext context) {
    final nameController = TextEditingController();
    final brandController = TextEditingController();
    final yearController = TextEditingController();
    final engineController = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Adicionar carro'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Modelo',
                  hintText: 'Ex.: Gol Power',
                ),
              ),
              TextField(
                controller: brandController,
                decoration: const InputDecoration(
                  labelText: 'Marca',
                  hintText: 'Ex.: Volkswagen',
                ),
              ),
              TextField(
                controller: yearController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Ano',
                  hintText: 'Ex.: 2009',
                ),
              ),
              TextField(
                controller: engineController,
                decoration: const InputDecoration(
                  labelText: 'Motor',
                  hintText: 'Ex.: EA111 1.6',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white70,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
              ),
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('Cancelar', style: TextStyle(fontSize: 16)),
            ),
            ElevatedButton(
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
                if (nameController.text.isEmpty ||
                    brandController.text.isEmpty ||
                    yearController.text.isEmpty ||
                    engineController.text.isEmpty) {
                  return;
                }

                final car = Car(
                  name: nameController.text,
                  brand: brandController.text,
                  year: int.parse(yearController.text),
                  engine: engineController.text,
                );

                context.read<CarProvider>().addCar(car);

                Navigator.pop(dialogContext);
              },
              child: const Text(
                'Adicionar',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }
}
