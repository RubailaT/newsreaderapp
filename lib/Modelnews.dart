import 'package:newsreaderapp/model_source.dart';

class NewsModel{
  Source? source;
  String? image;
  String? text;
  String? date_time;
  String? author;
  String? description;

  NewsModel(
      { this.source,
        this.image,
        this.text,
        this.date_time,
        this.author,
        this.description,
      });

  factory NewsModel.fromJson(Map<String,dynamic> json){
    return NewsModel(
      source: Source.fromjson(json['source']),
      image: json['urlToImage'],
      text: json['title'],
      date_time: json['publishedAt'],
      author: json['author'],
      description:json ['description'],
    );
  }
}