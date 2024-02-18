class NewsArt {
  String imgUrl='';
  String newsHead='';
  String newsDes='';
  String newsCnt='';
  String newsUrl='';

  NewsArt({
    required this.imgUrl,
    required this.newsHead,
    required this.newsDes,
    required this.newsCnt,
    required this.newsUrl,

  });
  static NewsArt fromApiToApp(Map< String,dynamic>article) {
    return NewsArt(
      imgUrl: article["urlToImage"],
      newsHead:  article["title"],
      newsDes: article["description"],
      newsCnt: article["content"],
      newsUrl: article["url"],
    );
  }
}