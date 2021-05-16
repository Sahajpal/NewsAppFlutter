import 'dart:convert';

import 'package:news_app_flutter/model/news_model.dart';
import 'package:http/http.dart' as http;

class News{
  List<NewsArticle> news = [];

  Future<void> getNews() async{
    String url = "https://hubblesite.org/api/v3/news";

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    jsonData.forEach((element){
      NewsArticle newsArticle = NewsArticle(
        news_id: element['news_id'],
        name: element['name'],
        url: element['url'],
      );

      news.add(newsArticle);
    });
  }
}