import 'package:car_rental_app/data/models/car.dart';
import 'package:car_rental_app/data/repositories/car_repository_impl.dart';

abstract class CarRepository{
  Future<List<Car>> fetchCars();
}