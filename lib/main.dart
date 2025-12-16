import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Place Detail',
      home: const PlacePage(),
    );
  }
}

class PlacePage extends StatelessWidget {
  const PlacePage({super.key});

  Widget buildButton(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: const Color.fromARGB(255, 240, 5, 5)),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Color.fromARGB(255, 250, 6, 6),
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(top: 20),
        children: [
          // TITLE SECTION (TOP)
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Taj Mahal',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Agra, India',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.star, color: const Color.fromARGB(255, 240, 236, 3)),
                SizedBox(width: 4),
                Text('46'),
              ],
            ),
          ),

          // BUTTON SECTION
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildButton(Icons.call, 'CALL'),
                buildButton(Icons.near_me, 'ROUTE'),
                buildButton(Icons.share, 'SHARE'),
              ],
            ),
          ),

          // TEXT SECTION
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'The Taj Mahal is one of the most famous monuments in the world. '
              'It was built in the 17th century by Mughal Emperor Shah Jahan '
              'in memory of his beloved wife Mumtaz Mahal. '
              'Made of white marble, the Taj Mahal is a symbol of eternal love '
              'and a masterpiece of Mughal architecture.',
              softWrap: true,
              style: TextStyle(fontSize: 14),
            ),
          ),

          // IMAGE SECTION (BOTTOM)
          Image.asset(
            'assets/tajmahal.jpg',
            width: double.infinity,
            height: 240,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
