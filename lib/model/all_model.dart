class alllistmodel {
  List<usermodel>? all ;
  alllistmodel.fromjeson(  Map<String,dynamic> jeson){
    all=[];

    jeson['results'].forEach(
            (elment)=>all!.add(
            usermodel.fromjeson(elment)
        )

    );


  }


}

class usermodel{
  String? backdrop_path ;
  String? original_title ;
  String? poster_path ;
  String? overview ;
  String? release_date ;
  String? original_language ;
  String? original_name;
  String? media_type ;


  usermodel.fromjeson(Map<String,dynamic> jeson){
    backdrop_path=jeson['backdrop_path'];
    original_title=jeson['original_title'];
    poster_path=jeson['poster_path'];
    overview=jeson['overview'];
    release_date=jeson['release_date'];
    original_language=jeson['original_language'];
    original_name=jeson['original_name'];
    media_type=jeson['media_type'];


  }


}