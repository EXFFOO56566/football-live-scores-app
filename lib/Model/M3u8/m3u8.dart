// To parse this JSON data, do
//
//     final m3U8 = m3U8FromJson(jsonString);

import 'dart:convert';

List<M3U8> m3U8FromJson(String str) => List<M3U8>.from(json.decode(str).map((x) => M3U8.fromJson(x)));

String m3U8ToJson(List<M3U8> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class M3U8 {
    M3U8({
        this.id,
        this.title,
        this.imagea,
        this.imageb,
        this.teama,
        this.teamb,
        this.m3U8,
    });

    int? id;
    String? title;
    String? imagea;
    String? imageb;
    String? teama;
    String? teamb;
    String? m3U8;

    factory M3U8.fromJson(Map<String, dynamic> json) => M3U8(
        id: json["id"],
        title: json["title"],
        imagea: json["imagea"],
        imageb: json["imageb"],
        teama: json["teama"],
        teamb: json["teamb"],
        m3U8: json["m3u8"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "imagea": imagea,
        "imageb": imageb,
        "teama": teama,
        "teamb": teamb,
        "m3u8": m3U8,
    };
}
