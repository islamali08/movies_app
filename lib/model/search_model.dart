class usersearchlistmodel {
  List<usermodel>? searc ;
  usersearchlistmodel.fromjeson(  Map<String,dynamic> jeson){
    searc=[];

    jeson['results'].forEach(
            (elment)=>searc!.add(
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

  usermodel.fromjeson(Map<String,dynamic> jeson){
    backdrop_path=jeson['backdrop_path'];
    original_title=jeson['original_title'];
    poster_path=jeson['poster_path'];
    overview=jeson['overview'];
    release_date=jeson['release_date'];
    original_language=jeson['original_language'];


  }


}