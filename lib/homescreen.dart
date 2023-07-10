import 'package:flutter/material.dart';
import 'package:newsreaderapp/Api_service.dart';
import 'package:newsreaderapp/Modelnews.dart';
import 'detailednews.dart';

class NewsReader extends StatefulWidget {
  const NewsReader({Key? key}) : super(key: key);

  @override
  State<NewsReader> createState() => _NewsReaderState();
}

class _NewsReaderState extends State<NewsReader> {
  Apiservice client=Apiservice();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  backgroundColor: Colors.black,
  centerTitle: true,
  title: Text("Daily News",style: TextStyle(
      color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
     toolbarHeight: 80,),
      body:FutureBuilder<List<NewsModel>>(
        future: client.getNews(),
        builder: (BuildContext context,AsyncSnapshot<List<NewsModel>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              // physics: ScrollPhysics(),
              // shrinkWrap: true,
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                var articles = snapshot.data![index];
                print("art ${articles}");

                return GestureDetector(
                  onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) =>
                      DetailedNews(
                        article: articles,
                      ),
                  ));
                },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 150,

                              decoration: BoxDecoration(
                                image: DecorationImage(


                                  image: NetworkImage(
                                      snapshot.data![index].image.toString()==''?"https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Solid_blue.svg/2500px-Solid_blue.svg.png":snapshot.data![index].image.toString()),
                                  // fit: BoxFit.fill,
                                ),

                              ),
                            ),
                          ),

                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 150,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment
                                      .start,

                                  children: [
                                    Text(snapshot.data![index].text.toString(),
                                      style: TextStyle(fontSize: 20),),
                                    Text(snapshot.data![index].date_time.toString(),
                                      style: TextStyle(fontSize: 15),),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
    return Center(child: CircularProgressIndicator());
        }),
    );
  }
}
