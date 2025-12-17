import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: myBody()),
    );   
  }

  Widget myBody(){
    return ListView( //dùng ListView để thay thế column, chống lỗi tràn màn hình
      scrollDirection: Axis.vertical, //để lăn chuột dọc
      children: [
       // ====== Hàng icon góc phải ======
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: const Icon(Icons.notifications_none),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.person_outline),
              onPressed: () {},
            ),
          ],
        ),

        const SizedBox(height: 10),
        //Welcome Text
        RichText(
          text: const TextSpan(
            style: TextStyle(fontSize: 32, fontFamily: 'Arial'),
            children: [
              TextSpan(
                text: 'Welcome, \n',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )
              ),
              TextSpan(
                text: 'Charlie',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ]
          ),
        ),
        const SizedBox(height: 20),


        //Search Box
        TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: const Icon(Icons.search),
            contentPadding: 
              const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )
          ),
        ),
        const SizedBox(height: 24),


        //Saved Places 
        const Text(
          'Saved Places',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
      ]
    );
  }


  
}