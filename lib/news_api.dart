import 'package:dio/dio.dart';
import 'package:flutter_nhom3_3/model/news.dart';

class NewsAPI {
  Future<List<Article>> getAllNews() async {
    var url =
        'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=e0f175800989480083e603060bc6ed30';

    var dio = Dio();
    var response = await dio.request(url);

    List<Article> listNews = [];

    if (response.statusCode == 200) {
      Map<String, dynamic> data = response.data;

      News news = News.fromJson(data);
      listNews = news.articles;
    } else {
      print("Bị lỗi API news");
    }

    return listNews;
  }
}

var newsApi = NewsAPI();
