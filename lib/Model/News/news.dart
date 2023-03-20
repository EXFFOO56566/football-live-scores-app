// To parse this JSON data, do
//
//     final news = newsFromJson(jsonString);

import 'dart:convert';

News newsFromJson(String str) => News.fromJson(json.decode(str));

String newsToJson(News data) => json.encode(data.toJson());

class News {
    News({
        this.active,
        this.news,
    });

    bool? active;
    List<NewsElement>? news;

    factory News.fromJson(Map<String, dynamic> json) => News(
        active: json["active"],
        news: List<NewsElement>.from(json["news"].map((x) => NewsElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "active": active,
        "news": List<dynamic>.from(news!.map((x) => x.toJson())),
    };
}

class NewsElement {
    NewsElement({
        this.id,
        this.title,
        this.image,
        this.discription,
    });

    int? id;
    String ?title;
    String ?image;
    String ?discription;

    factory NewsElement.fromJson(Map<String, dynamic> json) => NewsElement(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        discription: json["discription"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "discription": discription,
    };
}
