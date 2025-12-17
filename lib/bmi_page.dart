import 'package:flutter/material.dart';

class BMIPage extends StatefulWidget {
  const BMIPage({super.key});

  @override
  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  double? _bmi;
  String? _category;

  void _calculateBmi() {
    final height = double.tryParse(_heightController.text);
    final weight = double.tryParse(_weightController.text);

    if (height == null || height <= 0 || weight == null || weight <= 0) {
      setState(() {
        _bmi = null;
        _category = "Vui lòng nhập đúng chiều cao và cân nặng!";
      });
      return;
    }

    final bmi = weight / (height * height);

    String cat;
    if (bmi < 18.5) {
      cat = "Thiếu cân";
    } else if (bmi < 25) {
      cat = "Bình thường";
    } else if (bmi < 30) {
      cat = "Thừa cân";
    } else {
      cat = "Béo phì";
    }

    setState(() {
      _bmi = bmi;
      _category = cat;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F8F6),
      body: Column(
        children: [
          // ----- HEADER -----
          Container(
            width: double.infinity,
            height: 60,
            color: const Color(0xFF127C71),
            alignment: Alignment.center,
            child: const Text(
              "Tính chỉ số BMI",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // ----- BODY -----
          Expanded(
            child: Stack(
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: Column(
                    children: [
                      // Chiều cao
                      TextFormField(
                        controller: _heightController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Chiều cao (m)",
                          prefixIcon: const Icon(Icons.straighten),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Cân nặng
                      TextFormField(
                        controller: _weightController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Cân nặng (kg)",
                          prefixIcon: const Icon(Icons.monitor_weight),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),

                      // Nút tính BMI
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF127C71),
                          minimumSize: const Size(150, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        icon: const Icon(Icons.calculate, color: Colors.white),
                        label: const Text(
                          "Tính BMI",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: _calculateBmi,
                      ),

                      const SizedBox(height: 30),

                      // ----- KẾT QUẢ -----
                      if (_bmi != null) ...[
                        Text(
                          "Chỉ số BMI: ${_bmi!.toStringAsFixed(2)}",
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Phân loại: $_category",
                          style: const TextStyle(
                            color: Colors.redAccent,
                            fontSize: 16,
                          ),
                        ),
                      ],
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
                      backgroundColor: const Color.fromARGB(255, 23, 3, 95),
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
          ),
        ],
      ),
    );
  }
}