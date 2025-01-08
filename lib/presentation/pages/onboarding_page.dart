import 'package:car_rental_app/presentation/pages/car_list_screen.dart';
import 'package:flutter/material.dart';

class onboarding_page extends StatelessWidget {
  const onboarding_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2C2B34),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                // color: Colors.black,
                image: DecorationImage(
                  image: AssetImage('assets/onboarding5.png'),
                  fit: BoxFit.cover,
                )
              ),
            ),
          ),
          Expanded(
            child: Container(
              // color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Premium Cars.  \nEnjoy The Luxury",
                    style: TextStyle(color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10,),
                  Text("Premium and prestige car Daily Rental \nExperience the thril at a lower price",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    height: 54,
                    width: 318,
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context)=> carListScreen()), 
                          (route) => false
                        );
                      }, 
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                      ),
                      child: Text("Let\'s Go",
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}