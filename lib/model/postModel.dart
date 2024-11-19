class PostModel {
  final String idTeam;
  final String strTeam;
  final String strLocation;
  final String strBadge;
  bool isLiked;


  PostModel({required this.idTeam, required this.strTeam, required this.strLocation, required this.strBadge,this.isLiked = false});

Map<String, dynamic> toMap() {
    return {
      'idTeam': idTeam,
      'strTeam': strTeam,
      'strLocation': strLocation,
      'strBadge' : strBadge,
      'isLiked': isLiked ? 1 : 0,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      idTeam: map['idTeam'],
      strTeam: map['strTeam'],
      strLocation: map['strLocation'],
      strBadge: map['strBadge'],
      isLiked: map['isLiked'] == 1,
    );
  }


  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      idTeam:json['idTeam'],
      strTeam: json['strTeam'],
      strLocation: json['strLocation'],
      strBadge: json['strBadge'],
    );
  }
}