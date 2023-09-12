class comedylistmodel {
  List<usermodel>? comedy ;
  comedylistmodel.fromjeson(  Map<String,dynamic> jeson){
    comedy=[];

    jeson['results'].forEach(
            (elment)=>comedy!.add(
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
  String? name ;

  usermodel.fromjeson(Map<String,dynamic> jeson){
    backdrop_path=jeson['backdrop_path'];
    original_title=jeson['original_title'];
    poster_path=jeson['poster_path'];
    overview=jeson['overview'];
    release_date=jeson['release_date'];
    original_language=jeson['original_language'];
    name=jeson['name'];


  }


}