import 'package:flutter/material.dart';
import 'package:flutter_nhom3_3/news_api.dart';
import 'package:flutter_nhom3_3/model/news.dart';
import 'package:flutter_nhom3_3/news_detail.dart'; // Màn hình chi tiết

class MyNewsList extends StatefulWidget {
  const MyNewsList({super.key});

  @override
  State<MyNewsList> createState() => _MyNewsListState();
}

class _MyNewsListState extends State<MyNewsList> {
  late Future<List<Article>> futureNews;
  final List<String> defaultImages = [
    'https://images.unsplash.com/photo-1586953208448-b95a79798f07?w=400',
    'https://images.unsplash.com/photo-1504711434969-e33886168f5c?w=400',
    'https://images.unsplash.com/photo-1495020689067-958852a7765e?w=400',
    'https://images.unsplash.com/photo-1518611012118-696072aa579a?w=400',
  ];

  @override
  void initState() {
    super.initState();
    // Khởi tạo future để FutureBuilder sử dụng
    futureNews = newsApi.getAllNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Danh sách tin tức"),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          FutureBuilder<List<Article>>(
            future: futureNews,
            builder: (context, snap) {
              if (snap.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snap.hasError) {
                return Center(child: Text("Lỗi: ${snap.error}"));
              } else if (!snap.hasData || snap.data!.isEmpty) {
                return const Center(child: Text("Không có tin tức"));
              } else {
                return ListView.builder(
                  itemCount: snap.data!.length,
                  itemBuilder: (context, index) {
                    return myItem(snap.data![index], index);
                  },
                );
              }
            },
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 1, 9, 82),
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

  Widget myItem(Article a, int index) {
    return InkWell(
      onTap: () {
        // Chuyển sang màn hình chi tiết
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetail(article: a),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            )
          ],
        ),
        child: Row(
          children: [
            // Ảnh thumbnail
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: a.urlToImage != null
                  ? Image.network(
                      a.urlToImage!,
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      defaultImages[index % defaultImages.length],
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
            ),
            const SizedBox(width: 12),
            // Nội dung
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tiêu đề
                  Text(
                    a.title ?? "Không có tiêu đề",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  // Mô tả ngắn
                  Text(
                    a.description ?? "Không có mô tả",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 6),
                  // Thời gian
                  Text(
                    a.publishedAt?.toString() ?? "Không có thời gian",
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
