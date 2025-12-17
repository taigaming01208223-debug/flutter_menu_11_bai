import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  bool _obscurePass = true;
  bool _loading = false;

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _loading = true);

    // Giả lập API đăng ký
    await Future.delayed(Duration(seconds: 2));

    setState(() => _loading = false);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Đăng ký thành công!")),
    );
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
              "Form Đăng ký",
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
                                onPressed: _register,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50, vertical: 14),
                                ),
                                child: const Text(
                                  "Đăng ký",
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
                      backgroundColor: const Color.fromARGB(255, 0, 6, 90),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    child: const Text(
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