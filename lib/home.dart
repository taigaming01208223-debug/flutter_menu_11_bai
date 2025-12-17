import 'package:flutter/material.dart';
import 'package:flutter_nhom3_3/my_place.dart';
import 'package:flutter_nhom3_3/my_class.dart';
import 'package:flutter_nhom3_3/my_home1.dart';
import 'package:flutter_nhom3_3/change_color_app.dart';
import 'package:flutter_nhom3_3/countdown_timer_app.dart';
import 'package:flutter_nhom3_3/dem_so_app.dart';
import 'package:flutter_nhom3_3/login_page.dart';
import 'package:flutter_nhom3_3/bmi_page.dart';
import 'package:flutter_nhom3_3/feedback_page.dart';
import 'package:flutter_nhom3_3/my_product.dart';
import 'package:flutter_nhom3_3/my_news_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 55, 0, 255),

      // ===== AppBar trống =====
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        elevation: 0,
        toolbarHeight: 0,
      ),

      body: Row(
        children: [
          // ===== Sidebar =====
          Container(
            width: 160,
            color: const Color.fromARGB(255, 148, 119, 255),
            padding: const EdgeInsets.only(top: 30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                _buildSidebarItem(
                  title: 'Bài 1',
                  icon: Icons.book,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyPlace()),
                    );
                  },
                ),
                _buildSidebarItem(
                  title: 'Bài 2',
                  icon: Icons.class_,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyClass()),
                    );
                  },
                ),
                _buildSidebarItem(
                  title: 'Bài 3',
                  icon: Icons.home,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHome1()),
                    );
                  },
                ),
                _buildSidebarItem(
                  title: 'Bài 4',
                  icon: Icons.color_lens,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChangeColorApp()),
                    );
                  },
                ),
                _buildSidebarItem(
                  title: 'Bài 5',
                  icon: Icons.timer,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CountdownTimerApp()),
                    );
                  },
                ),
                _buildSidebarItem(
                  title: 'Bài 6',
                  icon: Icons.add,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DemSoApp()),
                    );
                  },
                ),
                _buildSidebarItem(
                  title: 'Bài 7',
                  icon: Icons.login,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                ),
                _buildSidebarItem(
                  title: 'Bài 8',
                  icon: Icons.monitor_weight,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BMIPage()),
                    );
                  },
                ),
                _buildSidebarItem(
                  title: 'Bài 9',
                  icon: Icons.feedback,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FeedbackPage()),
                    );
                  },
                ),
                _buildSidebarItem(
                  title: 'Bài 10',
                  icon: Icons.shopping_cart,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyProduct()),
                    );
                  },
                ),
                _buildSidebarItem(
                  title: 'Bài 11',
                  icon: Icons.article,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyNewsList()),
                    );
                  },
                ),
                _buildSidebarItem(
                  title: 'Bài 12',
                  icon: Icons.app_registration,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                ),
                ],
              ),
            ),
          ),

          // ===== Main Content =====
          Expanded(
            child: Center(
              child: Container(
                width: 420,
                padding: const EdgeInsets.all(24),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.25),
                      blurRadius: 12,
                      spreadRadius: 3,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ===== Title =====
                    Row(
                      children: [
                        Icon(Icons.person,
                            color: const Color.fromARGB(255, 0, 0, 0), size: 28),
                        const SizedBox(width: 10),
                        Text(
                          'THÔNG TIN SINH VIÊN',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    _buildFormItem(
                      label: 'Họ và tên',
                      value: 'Trần Đức Hữu Tài',
                      icon: Icons.person_outline,
                    ),
                    const SizedBox(height: 15),

                    _buildFormItem(
                      label: 'Mã sinh viên',
                      value: '22T1020398',
                      icon: Icons.badge_outlined,
                    ),
                    const SizedBox(height: 15),

                    _buildFormItem(
                      label: 'Trường Đang Theo Học',
                      value: 'Trường Đại Học Khoa Học',
                      icon: Icons.school_outlined,
                    ),
                    const SizedBox(height: 15),

                    _buildFormItem(
                      label: 'Email',
                      value: '22T1020398@husc.edu.vn',
                      icon: Icons.email_outlined,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ===== Sidebar Item =====
  Widget _buildSidebarItem({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 19, 0, 126),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: const Color.fromARGB(255, 2, 0, 0)),
            const SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 166, 158, 212),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ===== Form item giống input PHP =====
  Widget _buildFormItem({
    required String label,
    required String value,
    required IconData icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: const Color.fromARGB(255, 26, 2, 133),
          ),
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color.fromARGB(255, 21, 0, 49)),
          ),
          child: Row(
            children: [
              Icon(icon, color: const Color.fromARGB(255, 19, 0, 54)),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  value,
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 5, 70),
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
