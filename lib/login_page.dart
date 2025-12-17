import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'profile_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  bool _obscurePass = true;
  bool _loading = false;

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _loading = true);

    final url = Uri.parse("https://dummyjson.com/auth/login");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "username": _userController.text.trim(),
          "password": _passController.text.trim(),
        }),
      );

      setState(() => _loading = false);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // → TRUYỀN NGUYÊN JSON qua ProfilePage
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => ProfilePage(userData: data)),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Sai username hoặc password!")),
        );
      }
    } catch (e) {
      setState(() => _loading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Lỗi kết nối: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FF),
      body: Column(
        children: [
          // HEADER
          Container(
            height: 70,
            width: double.infinity,
            color: Colors.blue,
            alignment: Alignment.center,
            child: const Text(
              "Form Đăng nhập",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),

          Expanded(
            child: Stack(
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                      TextFormField(
                        controller: _userController,
                        decoration: const InputDecoration(
                          labelText: "Tên người dùng",
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? "Nhập username" : null,
                      ),

                      const SizedBox(height: 20),

                      TextFormField(
                        controller: _passController,
                        obscureText: _obscurePass,
                        decoration: InputDecoration(
                          labelText: "Mật khẩu",
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(_obscurePass
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () => setState(() {
                              _obscurePass = !_obscurePass;
                            }),
                          ),
                          border: const OutlineInputBorder(),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? "Nhập mật khẩu" : null,
                      ),

                      const SizedBox(height: 35),

                      _loading
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                              onPressed: _login,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 14),
                              ),
                              child: const Text(
                                "Đăng nhập",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
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
                      backgroundColor: const Color.fromARGB(255, 1, 6, 78),
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
