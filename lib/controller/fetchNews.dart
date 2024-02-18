// https://newsapi.org/v2/top-headlines?country=in&apiKey=bbe8bd0a3f1140b2970ed790acf95d7b

import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart';
import 'package:news_snack/model/newsArt.dart';

class FetchNews {
  static List sourcesId = [
    "abc-news",
    "bbc-news",
    "bbc-sport",
    "business-insider",
    "engadget",
    "entertainment-weekly",
    "espn",
    "espn-cric-info",
    "financial-post",
    "fox-news",
    "fox-sports",
    "google-news",
    "google-news-in",
    "medical-news-today",
    "national-geographic",
    "news24",
    "new-scientist",
    "new-york-magazine",
    "next-big-future",
    "techcrunch",
    "techradar",
    "the-hindu",
    "the-wall-street-journal",
    "the-washington-times",
    "time",
    "usa-today",
  ];

   static Future<NewsArt> fetchNews() async {
     List<dynamic> articles=[];

     final _random = new Random();
    var sourceID = sourcesId[_random.nextInt(sourcesId.length)];
    print(sourceID);

    Response response = await get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?sources=$sourceID&apiKey=bbe8bd0a3f1140b2970ed790acf95d7b"));
    Map body_data = jsonDecode(response.body);
     articles = body_data["articles"];
    final _newRandom= new Random();
    print("*******************");
    var myArticle = articles[_newRandom.nextInt(articles.length)];
    print(myArticle);
    print("*******************");
     return NewsArt.fromApiToApp((myArticle));

  }
}
