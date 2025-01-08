import 'package:car_rental_app/data/models/Car.dart';
import 'package:car_rental_app/presentation/widget/car_card.dart';
import 'package:flutter/material.dart';

class carListScreen extends StatelessWidget {
  carListScreen({super.key});
  final List<Car> cars = [
    Car(model: "Fortuner GR", distance: 878, fuelCapacity: 50, pricePerHour: 45),
    Car(model: "Swift Dzire", distance: 578, fuelCapacity: 40, pricePerHour: 25),
    Car(model: "Ertiga", distance: 1078, fuelCapacity: 65, pricePerHour: 35),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Your Car"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index){
          return CarCard(car: cars[index]);
        }
      ),
    );
  }
}