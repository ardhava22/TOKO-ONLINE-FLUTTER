import 'package:toko_online_flutter/services/url.dart' as url;


class TokoModel {
  int? id;
  String? title;
  double? voteAverage;
  String? overview;
  String? posterPath;
  TokoModel({
    required this.id,
    required this.title,
    this.voteAverage,
    this.overview,
    required this.posterPath,
  });
  TokoModel.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson["id"];
    title = parsedJson["title"];
    voteAverage = double.parse(parsedJson["voteaverage"].toString());
    overview = parsedJson["overview"];
    posterPath = "${url.BaseUrl}/${parsedJson["posterpath"]}";
  }
}
