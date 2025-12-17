import 'package:flutter/material.dart';

class DemSoApp extends StatefulWidget {
  const DemSoApp({super.key});

  @override
  State<DemSoApp> createState() => _DemSoAppState();
}

class _DemSoAppState extends State<DemSoApp> {
  int _count = 0;

  void _tang() {
    setState(() {
      _count++;
    });
  }

  void _giam() {
    setState(() {
      _count--;
    });
  }

  void _datLai() {
    setState(() {
      _count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "🔢 Ứng dụng Đếm Số",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Giá trị hiện tại:",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '$_count',
                  style: const TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.red, // 🔴 Luôn là màu đỏ
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Nút Giảm
                    ElevatedButton.icon(
                      onPressed: _giam,
                      icon: const Icon(Icons.remove, color: Colors.white),
                      label: const Text(
                        "Giảm",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                      ),
                    ),
                    const SizedBox(width: 15),

                    // Nút Đặt lại
                    ElevatedButton.icon(
                      onPressed: _datLai,
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
                    const SizedBox(width: 15),

                    // Nút Tăng
                    ElevatedButton.icon(
                      onPressed: _tang,
                      icon: const Icon(Icons.add, color: Colors.white),
                      label: const Text(
                        "Tăng",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
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
                backgroundColor: const Color.fromARGB(255, 0, 6, 88),
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