import 'package:flutter/material.dart';

class MyHome1 extends StatelessWidget {
  const MyHome1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Container(
                width: 600,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                // --- Top bar icons ---
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(Icons.notifications_none, size: 28),
                    SizedBox(width: 16),
                    Icon(Icons.alarm, size: 28),
                  ],
                ),
                const SizedBox(height: 20),

                // --- Welcome text ---
                const Text(
                  "Welcome,",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Charlie",
                  style: TextStyle(fontSize: 26,),
                ),
                const SizedBox(height: 20),

                // --- Search box ---
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // --- Saved Places section ---
                const Text(
                  "Saved Places",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),

                // --- Grid of images ---
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  physics: const NeverScrollableScrollPhysics(),
                    children: const [
                      ImageCard(imagePath: 'assets/image/anh1.jpg'),
                      ImageCard(imagePath: 'assets/image/anh2.jpg'),
                      ImageCard(imagePath: 'assets/image/anh3.jpg'),
                      ImageCard(imagePath: 'assets/image/anh4.jpg'),
                  ],
                ),
                  ],
                ),
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
                backgroundColor: const Color.fromARGB(255, 17, 0, 80),
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
}

class ImageCard extends StatelessWidget {
  final String imagePath;
  const ImageCard({required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(imagePath, fit: BoxFit.cover),
    );
  }
}