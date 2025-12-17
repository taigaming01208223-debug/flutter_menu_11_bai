import 'dart:math';
import 'package:flutter/material.dart';

class ChangeColorApp extends StatefulWidget {
  const ChangeColorApp({super.key});

  @override
  State<ChangeColorApp> createState() => _ChangeColorAppState();
}

class _ChangeColorAppState extends State<ChangeColorApp> {
  Color bgColor = Colors.purple;
  String colorName = "Tím";

  final List<Color> listColor = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange
  ];

  final List<String> listColorString = [
    'Đỏ',
    'Xanh lá',
    'Xanh dương',
    'Cam',
  ];

  void _changeColor() {
    var rand = Random();
    var numberRandom = rand.nextInt(listColor.length);
    setState(() {
      bgColor = listColor[numberRandom];
      colorName = listColorString[numberRandom];
    });
  }

  void _resetColor() {
    setState(() {
      bgColor = Colors.purple;
      colorName = "Tím";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "🎨 Ứng dụng Đổi màu nền",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            color: bgColor, // nền thay đổi màu
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Màu hiện tại",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  colorName,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: _changeColor,
                      icon: const Icon(Icons.color_lens, color: Colors.white),
                      label: const Text(
                        "Đổi màu",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                      ),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton.icon(
                      onPressed: _resetColor,
                      icon: const Icon(Icons.refresh, color: Colors.white),
                      label: const Text(
                        "Đặt lại",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                      ),
                    ),
                  ],
                ),
              ],
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
                backgroundColor: const Color.fromARGB(255, 22, 1, 100),
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