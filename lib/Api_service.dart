import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:newsreaderapp/Modelnews.dart';

class Apiservice{


  Future<List<NewsModel>>getNews()async{
    final url="https://newsapi.org/v2/everything?q=bitcoin&apiKey=6737a6fcbaf44442a32385e85a7651f9";
    // "https://newsapi.org/v2/everything?q=tesla&from=2023-06-06&sortBy=publishedAt&apiKey=6737a6fcbaf44442a32385e85a7651f9";
var response=await http.get(Uri.parse(url));
if(response.statusCode==200) {
  var body = json.decode(response.body);
  print(body);
  List<NewsModel> _data = List<NewsModel>.from(
      body['articles'].map((e) => NewsModel.fromJson(e)).toList());
  return _data;
}
else{
  List<NewsModel> _data=[];
  return _data;

}

  }
}