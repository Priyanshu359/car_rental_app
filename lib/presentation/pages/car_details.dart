import 'package:car_rental_app/data/models/Car.dart';
import 'package:car_rental_app/presentation/pages/map_details_page.dart';
import 'package:car_rental_app/presentation/widget/car_card.dart';
import 'package:car_rental_app/presentation/widget/more_card.dart';
import 'package:flutter/material.dart';

class CarDetailsPage extends StatefulWidget {
 final Car car;

  const CarDetailsPage({super.key, required this.car});

  @override
  State<CarDetailsPage> createState() => _CarDetailsPageState();
}

class _CarDetailsPageState extends State<CarDetailsPage> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;
  void initState(){
    _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this
    );
    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(_controller!)
      ..addListener(() { setState(() {
    });});
    _controller!.forward();
    super.initState();
  }

  void dispose(){
    _controller!.forward();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.info_outline),
            Text(" Information",)
          ],
        ),
      ),
      body: Column(
        children: [
          CarCard(car: Car(
            model: widget.car.model,
            distance: widget.car.distance,
            fuelCapacity: widget.car.fuelCapacity,
            pricePerHour: widget.car.pricePerHour),
          ), 
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xffF3F3F3),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          spreadRadius: 5,
                        )
                      ]
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('assets/user.png'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Jane Cooper",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "\$4.253",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20,),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => MapsDetailsPage(car: widget.car))
                      );
                    },
                    child: Container(
                      //margin: EdgeInsets.all(20),
                      height: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            spreadRadius: 5,
                          )
                        ]
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Transform.scale(
                          scale: _animation!.value,
                          alignment: Alignment.center,
                          child: Image.asset('assets/maps.png', fit: BoxFit.cover,),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                MoreCard(car: Car(
                  model: widget.car.model+"-1",
                  distance: widget.car.distance+100,
                  fuelCapacity: widget.car.fuelCapacity+100,
                  pricePerHour: widget.car.pricePerHour+10)
                ),
                SizedBox(height: 5,),
                MoreCard(car: Car(
                  model: widget.car.model+"-2",
                  distance: widget.car.distance+200,
                  fuelCapacity: widget.car.fuelCapacity+200,
                  pricePerHour: widget.car.pricePerHour+20)
                ),
                SizedBox(height: 5,),
                MoreCard(car: Car(
                  model: widget.car.model+"-3",
                  distance: widget.car.distance+300,
                  fuelCapacity: widget.car.fuelCapacity+300,
                  pricePerHour: widget.car.pricePerHour+30)
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}