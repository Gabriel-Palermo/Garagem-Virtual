class Car {
  String name;
  String brand;
  int year;
  String engine;
  bool isFavorite;

  Car({
    required this.name,
    required this.brand,
    required this.year,
    required this.engine,
    this.isFavorite = false,
  });
}
