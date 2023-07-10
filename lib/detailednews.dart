 import 'package:flutter/material.dart';
import 'package:newsreaderapp/Modelnews.dart';

class DetailedNews extends StatelessWidget {
  final NewsModel article;
  DetailedNews({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Image(image: NetworkImage(article.image.toString())),
          Padding(padding: EdgeInsets.all(8.0),
            child: Text(
              article.text.toString(),
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(padding: EdgeInsets.all(8.0),
            child: Text(
              article.description.toString(),
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(padding: EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.bottomRight,
              child: Text(article.author.toString(), style: TextStyle(fontSize: 15),)),)
        ],
      ),
    );
  }
}
