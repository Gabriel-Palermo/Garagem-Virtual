import 'package:flutter/foundation.dart';
import '../models/car.dart';

class CarProvider extends ChangeNotifier {
  final List<Car> _cars = [];

  List<Car> get cars => _cars;

  List<Car> get favoriteCars => _cars.where((car) => car.isFavorite).toList();

  void addCar(Car car) {
    _cars.add(car);
    notifyListeners();
  }

  void removeCar(Car car) {
    _cars.remove(car);
    notifyListeners();
  }

  void toggleFavorite(Car car) {
    car.isFavorite = !car.isFavorite;
    notifyListeners();
  }
}
