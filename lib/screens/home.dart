import 'package:flutter/material.dart';
import 'package:news_app_flutter/helper/news.dart';
import 'package:news_app_flutter/model/news_model.dart';
import 'package:news_app_flutter/widget/news_tile.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<NewsArticle> articles = <NewsArticle>[];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews() async {
    News news = News();
    await news.getNews();
    articles = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'News',
          style: TextStyle(
            color: Colors.lightBlue,
            fontSize: 30,
          ),
        ),
        elevation: 0.0,
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    return NewsTile(
                        name: articles[index].name,
                        newsId: articles[index].news_id);
                  }),
            ),
    );
  }
}
