import 'package:flutter/material.dart';

class MyPlace extends StatelessWidget {
  const MyPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(   //đưa toàn bộ bố cục vào giữa
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  block1(),
                  block2(),
                  block3(),
                  block4(),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 10, 0, 95),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: Text(
                'Back',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget block1() {
    var src =
        "https://images.unsplash.com/photo-1559586616-361e18714958?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0";
    return Image.network(
      src,
      width: 600,
      height: 240,
      fit: BoxFit.cover,
    );
  }

  Widget block2() {
    var title = "Oeschinen Lake Campground";
    var subtitle = "Kandersteg, Switzerland";
    return Container(
      width: 600, // giữ cố định ngang bằng block1
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(subtitle,
                  style: const TextStyle(fontSize: 15, color: Colors.grey)),
            ],
          ),
          Row(
            children: const [
              Icon(Icons.star, color: Colors.red),
              SizedBox(width: 4),
              Text('41'),
            ],
          ),
        ],
      ),
    );
  }

  Widget block3() {
    var iconList = [Icons.call, Icons.near_me, Icons.share];
    var textList = ["CALL", "ROUTE", "SHARE"];

    return Container(
      width: 600,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(iconList.length, (i) {
          return Column(
            children: [
              Icon(iconList[i], color: Colors.blue),
              const SizedBox(height: 8),
              Text(textList[i],
                  style: const TextStyle(color: Colors.blue)),
            ],
          );
        }),
      ),
    );
  }

  Widget block4() {
    var data =
        "Lake Oeschinen lies at the foot of the Bluemlisalp in the Bernese Alps. "
        "Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. "
        "A gondola ride from Kandersteg, followed by a half-hour walk through pastures "
        "and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. "
        "Activities enjoyed here include rowing, and riding the summer toboggan run.";
    return Container(
      width: 600,
      padding: const EdgeInsets.all(20.0),
      child: Text(
        data,
        textAlign: TextAlign.justify,
        style: const TextStyle(fontSize: 16, height: 1.5),
      ),
    );
  }
}
