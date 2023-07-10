class Source{
  String? name;
  int? id;
  Source({this.name,this.id});

  factory Source.fromjson(Map<String, dynamic>json){
    return  Source(
      name: json['name'],

    );


  }
}