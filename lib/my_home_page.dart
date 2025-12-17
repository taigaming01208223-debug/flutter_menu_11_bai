import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(  //con của Column
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,  //can le truc chinh (truc doc), trên cùng: star, nằm dưới: end
        children: [                                         //spaceAround: 6 khoảng trống. spaceBetween: 3 khoảng trống, spaceEvenly: 4 khoảng cách = nhau
          Center(child: Text("Hello World", style: TextStyle(color: Colors.red, fontSize: 20))), //giua man hinh
          Icon(Icons.heart_broken, color: Colors.red, size: 100),
          Text("Goodbye World", style: TextStyle(color: Colors.blue, fontSize: 100))
        ],
      )
      
    );
  }
}