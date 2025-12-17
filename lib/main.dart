import 'package:flutter/material.dart';
import 'package:flutter_nhom3_3/home.dart';
// import 'package:flutter_nhom3_3/my_place.dart';
// import 'package:flutter_nhom3_3/my_class.dart';
// import 'package:flutter_nhom3_3/my_classroom.dart';
//import 'package:flutter_nhom3_3/my_home.dart';
// import 'package:flutter_nhom3_3/my_home1.dart';
// import 'package:flutter_nhom3_3/my_home_page.dart';
// import 'package:flutter_nhom3_3/change_color_app.dart';
// import 'package:flutter_nhom3_3/dem_so_app.dart';
//import 'package:flutter_nhom3_3/countdown_timer_app.dart';
//import 'package:flutter_nhom3_3/register_page.dart';
// import 'package:flutter_nhom3_3/bmi_page.dart';
// import 'package:flutter_nhom3_3/feedback_page.dart';
//import 'package:flutter_nhom3_3/my_product.dart';
// import 'package:flutter_nhom3_3/my_news_list.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {  //stl
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}