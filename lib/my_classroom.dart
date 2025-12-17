import 'package:flutter/material.dart';

class MyClassroom extends StatelessWidget {
  const MyClassroom ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: myBody()),
    );   
  }
  Widget myBody(){
    return ListView( //dùng ListView để thay thế column, chống lỗi tràn màn hình
      scrollDirection: Axis.vertical, //để lăn chuột dọc
      children: List.generate(20, (index) => item()),//trả về 20 item gồm 20 Widget
    );
  }
  Widget item(){
    return Container(
      height: 150,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top:0, left: 10, right: 10, bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 19, 9, 9)),
        color: Colors.amberAccent,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, //hướng chính của row
        crossAxisAlignment: CrossAxisAlignment.start,  //hướng phụ của row
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("XML và ứng dụng - Nhóm 1",
                  style: TextStyle(fontWeight: FontWeight.bold),),
                  Text("2025-2026.1.TIN4583.001")
                ],
              ),
              Text("58 học viên")
            ],
          ),
          IconButton(onPressed: (){
            print("Hello");  //để code chức năng chứ ko hiển thị giao diện
          }, icon: Icon(Icons.more_horiz))
      
        ],
      ),
    );
     
  }
}