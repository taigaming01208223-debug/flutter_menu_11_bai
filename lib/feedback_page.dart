import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  String rating = "4 sao"; // Giá trị mặc định

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7F3),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // 🔶 Header cam
                Container(
                  width: double.infinity,
                  height: 65,
                  color: Colors.deepOrange,
                  alignment: Alignment.center,
                  child: const Text(
                    "Gửi phản hồi",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 👤 Họ tên
                      TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: "Họ tên",
                          prefixIcon: const Icon(Icons.person_outline),
                          filled: true,
                          fillColor: const Color(0xFFFFF7F3),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),

                      // ⭐ Ô chọn sao nền giống các ô còn lại
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 14),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF7F3), // ⭐ nền giống TextField
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: Colors.brown.shade300,
                                width: 1.2,
                              ),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: rating,
                                isExpanded: true,
                                icon: const Icon(Icons.arrow_drop_down),
                                items: [
                                  "1 sao",
                                  "2 sao",
                                  "3 sao",
                                  "4 sao",
                                  "5 sao",
                                ].map((e) {
                                  return DropdownMenuItem(
                                    value: e,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.brown.shade700,
                                          size: 26,
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          e,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    rating = value!;
                                  });
                                },
                              ),
                            ),
                          ),

                          // ⭐ Label trên viền
                          Positioned(
                            left: 20,
                            top: -10,
                            child: Container(
                              color: const Color(0xFFFFF7F3),
                              padding: const EdgeInsets.symmetric(horizontal: 6),
                              child: Text(
                                "Đánh giá (1 - 5 sao)",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.brown.shade700,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 25),

                      // 📝 Nội dung góp ý
                      TextField(
                        controller: _contentController,
                        maxLines: 5,
                        decoration: InputDecoration(
                          labelText: "Nội dung góp ý",
                          alignLabelWithHint: true,
                          filled: true,
                          fillColor: const Color(0xFFFFF7F3),
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(top: 12), // đẩy icon xuống nhẹ
                            child: Icon(Icons.message_outlined),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      // 🔘 Nút gửi phản hồi
                      Center(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          icon: const Icon(Icons.send, color: Colors.white),
                          label: const Text(
                            "Gửi phản hồi",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Gửi phản hồi thành công!"),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
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
                backgroundColor: const Color.fromARGB(255, 2, 1, 73),
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