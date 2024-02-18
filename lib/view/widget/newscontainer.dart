import 'package:flutter/material.dart';
import 'package:news_snack/view/detail_view.dart';
class NewsContainer extends StatelessWidget {
  String imgUrl;
  String newsHead;
  String newsDes;
  String newsCnt;
  String newsUrl;

   NewsContainer({super.key,
   required this.imgUrl,
   required this.newsHead,
   required this.newsDes,
     required this.newsCnt,
     required this.newsUrl,
   });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children:<Widget> [
        Image.network(
          height:300,
          width:MediaQuery.of(context).size.width,
          fit:BoxFit.fitWidth,
          imgUrl),
          Container(padding: const EdgeInsets.symmetric(horizontal: 15),

            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               const SizedBox(height: 6),
                Text(newsHead,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w700,fontStyle: FontStyle.normal),),
                const SizedBox(height: 16),
                Text(newsDes,style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: Colors.grey[38]) ,),
                const  SizedBox(height: 16),
                Text(newsCnt, style:const TextStyle(fontSize: 14,fontWeight: FontWeight.normal) ,),
              ],
            ),

          ),
         Spacer(),

        Row(mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(onPressed: (){
                Navigator.push(context,  MaterialPageRoute (
                  builder: (BuildContext context) =>  DetailViewScreen(newsUrl:newsUrl),
                ),
                );
              }, child: const Text(" Read more  ")),
            ),
          ],
        ),

          const SizedBox(height: 25,),
      ],),

    );
  }
}
