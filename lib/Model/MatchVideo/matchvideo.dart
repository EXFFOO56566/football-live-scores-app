// To parse this JSON data, do
//
//     final matchVideo = matchVideoFromJson(jsonString);

import 'dart:convert';

MatchVideo matchVideoFromJson(String str) => MatchVideo.fromJson(json.decode(str));

String matchVideoToJson(MatchVideo data) => json.encode(data.toJson());

class MatchVideo {
  MatchVideo({
    this.video,
  });

  List<Video>? video;

  factory MatchVideo.fromJson(Map<String, dynamic> json) => MatchVideo(
    video: List<Video>.from(json["video"].map((x) => Video.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "video": List<dynamic>.from(video!.map((x) => x.toJson())),
  };
}

class Video {
  Video({
    this.id,
    this.match,
    this.video,
    this.tracking,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? match;
  String? video;
  String? tracking;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
    id: json["id"],
    match: json["match"],
    video: json["video"],
    tracking: json["tracking"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "match": match,
    "video": video,
    "tracking": tracking,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
