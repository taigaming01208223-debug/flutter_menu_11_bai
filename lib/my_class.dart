import 'package:flutter/material.dart';

class MyClass extends StatelessWidget {
  const MyClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  block1(),
                  block2(),
                  block3(),
                  block4(),
                  block5(),
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
                backgroundColor: const Color.fromARGB(255, 16, 0, 87),
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


  Widget block1() {
    return Container(
      width: 600,
      height: 120,
      margin: const EdgeInsets.symmetric(vertical: 10),  //khoảng cách giữa các Container
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12), //bo tròn 4 góc của Container
        color: const Color.fromARGB(255, 3, 240, 35),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black.withOpacity(0.4),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Text(
                    "XML và ứng dụng - Nhóm 1",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_horiz, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
            const Text(
              "2025-2026.1.TIN4583.001",
              style: TextStyle(color: Colors.white70, fontSize: 13),
            ),
            const Text(
              "58 học viên",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget block2() {
    return Container(
      width: 600,
      height: 120,
      margin: const EdgeInsets.symmetric(vertical: 10),  //khoảng cách giữa các Container
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12), //bo tròn 4 góc của Container
        color: const Color.fromARGB(255, 255, 138, 4),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black.withOpacity(0.4),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Text(
                    "Lập trình ứng dụng cho các thiết bị di động - Nhóm 2",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_horiz, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
            const Text(
              "2025-2026.1.TIN4403.006",
              style: TextStyle(color: Colors.white70, fontSize: 13),
            ),
            const Text(
              "55 học viên",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget block3() {
    return Container(
      width: 600,
      height: 120,
      margin: const EdgeInsets.symmetric(vertical: 10),  //khoảng cách giữa các Container
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12), //bo tròn 4 góc của Container
        color: const Color.fromARGB(255, 255, 0, 0),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black.withOpacity(0.4),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Text(
                    "Lập trình ứng dụng cho các thiết bị di động - Nhóm 2",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_horiz, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
            const Text(
              "2025-2026.1.TIN4403.005",
              style: TextStyle(color: Colors.white70, fontSize: 13),
            ),
            const Text(
              "52 học viên",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget block4() {
    return Container(
      width: 600,
      height: 120,
      margin: const EdgeInsets.symmetric(vertical: 10),  //khoảng cách giữa các Container
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12), //bo tròn 4 góc của Container
        color: Colors.green,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black.withOpacity(0.4),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Text(
                    "Lập trình ứng dụng cho các - Nhóm 1",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_horiz, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
            const Text(
              "2025-2026.1.TIN4583.001",
              style: TextStyle(color: Colors.white70, fontSize: 13),
            ),
            const Text(
              "58 học viên",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget block5() {
    return Container(
      width: 600,
      height: 120,
      margin: const EdgeInsets.symmetric(vertical: 10),  //khoảng cách giữa các Container
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12), //bo tròn 4 góc của Container
        color: Colors.blue,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black.withOpacity(0.4),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Text(
                    "XML và ứng dụng - Nhóm 1",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_horiz, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
            const Text(
              "2025-2026.1.TIN4583.001",
              style: TextStyle(color: Colors.white70, fontSize: 13),
            ),
            const Text(
              "58 học viên",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
