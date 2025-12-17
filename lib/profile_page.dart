import 'package:flutter/material.dart';
import 'login_page.dart';

class ProfilePage extends StatelessWidget {
  final Map<String, dynamic> userData;

  const ProfilePage({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [

            // ===================== HEADER =====================
            Row(
              children: [
                CircleAvatar(
                  radius: 32,
                    backgroundColor: Colors.grey[200],
                    backgroundImage: userData["image"] != null
                        ? NetworkImage(userData["image"])
                        : null,
                    child: userData["image"] == null
                        ? const Icon(Icons.person, size: 36, color: Colors.grey)
                        : null,
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Hello,", style: TextStyle(fontSize: 16, color: Colors.black54)),
                    Text(
                      "${userData["firstName"]}",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                )
              ],
            ),

            const SizedBox(height: 25),

            // ===================== AUTH BOX =====================
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade400, Colors.blue.shade200],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                    Icon(Icons.verified_user, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      "Authenticated",
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ]),
                  const SizedBox(height: 10),
                  Text(
                    "Welcome back, ${userData["firstName"]} ${userData["lastName"]}!",
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  Text(
                    "@${userData["username"]}",
                    style: TextStyle(color: Colors.white.withOpacity(0.9)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // ===================== PROFILE INFO BOX =====================
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.person, color: Colors.blue),
                      SizedBox(width: 10),
                      Text("Profile", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 18),

                  buildItem(Icons.tag, "ID", "#${userData["id"]}"),
                  buildDivider(),

                  buildItem(Icons.account_circle, "Username", userData["username"]),
                  buildDivider(),

                  buildItem(Icons.email, "Email", userData["email"]),
                  buildDivider(),

                  buildItem(Icons.badge, "Full Name",
                      "${userData["firstName"]} ${userData["lastName"]}"),
                  buildDivider(),

                  buildItem(Icons.people, "Gender", userData["gender"]),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // ===================== QUICK ACTION BUTTONS =====================
            Row(
              children: [
                Expanded(
                  child: actionButton(
                    icon: Icons.refresh,
                    text: "Refresh",
                    color: Colors.blue,
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: actionButton(
                    icon: Icons.logout,
                    text: "Logout",
                    color: Colors.red,
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginPage()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ========================== ITEM INFO ==========================
  Widget buildItem(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.blue.shade700),
        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  )),
              const SizedBox(height: 4),
              Text(value, style: const TextStyle(color: Colors.black87)),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Divider(color: Colors.grey[400]),
    );
  }

  // ========================== ACTION BUTTON ==========================
  Widget actionButton({
    required IconData icon,
    required String text,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        height: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              color: Colors.black.withOpacity(0.06),
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: color),
            const SizedBox(height: 10),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
