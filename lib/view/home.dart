import 'package:flutter/material.dart';
import 'package:news_snack/controller/fetchNews.dart';
import 'package:news_snack/model/newsArt.dart';
import 'package:news_snack/view/widget/newscontainer.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   NewsArt ?newsArt;



  @override
  void initState() {
    getNews();
    super.initState();
  }
  getNews()async{

  newsArt=  await FetchNews.fetchNews();
  setState(() {

  });
  print(newsArt);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          controller: PageController(initialPage: 0),
          onPageChanged: (value){
            getNews();
            },
          itemBuilder: (context,index){
            FetchNews.fetchNews();
            return NewsContainer(imgUrl: newsArt?.imgUrl??'',
                newsHead: newsArt?.newsHead??'',
                newsDes: newsArt?.newsDes??'',
                newsCnt: newsArt?.newsCnt??'',
                newsUrl: newsArt?.newsUrl??'');

          }
    ),
    );
  }
}