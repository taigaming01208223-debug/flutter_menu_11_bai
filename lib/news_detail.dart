import 'package:flutter/material.dart';
import 'package:flutter_nhom3_3/model/news.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetail extends StatelessWidget {
  final Article article;

  const NewsDetail({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chi tiết tin tức"),
        backgroundColor: Colors.blue,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ảnh lớn
            if (article.urlToImage != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  article.urlToImage!,
                  height: 230,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

            const SizedBox(height: 16),

            // Tiêu đề
            Text(
              article.title ?? "Không có tiêu đề",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // Tác giả + thời gian
            Text(
              "Tác giả: ${article.author ?? 'Không rõ'}",
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),

            const SizedBox(height: 5),

            Text(
              "Ngày đăng: ${article.publishedAt?.toString() ?? 'Không rõ'}",
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),

            const SizedBox(height: 18),

            // Mô tả
            if (article.description != null)
              Text(
                article.description!,
                style: const TextStyle(fontSize: 16),
              ),

            const SizedBox(height: 16),

            // Nội dung bài viết
            Container(
              padding: const EdgeInsets.all(14),
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
              child: Text(
                (article.content != null && article.content!.isNotEmpty)
                    ? article.content!
                    : "Không có nội dung chi tiết.",
                style: const TextStyle(fontSize: 16),
              ),
            ),

            const SizedBox(height: 25),

            // Button mở bài viết thật
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  final url = Uri.parse(article.url);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  }
                },
                child: const Text(
                  "Mở bài viết gốc",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
