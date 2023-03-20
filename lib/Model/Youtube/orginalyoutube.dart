// To parse this JSON data, do
//
//     final youtubeapidata = youtubeapidataFromJson(jsonString);

import 'dart:convert';

Youtubeapidata youtubeapidataFromJson(String str) => Youtubeapidata.fromJson(json.decode(str));

String youtubeapidataToJson(Youtubeapidata data) => json.encode(data.toJson());

class Youtubeapidata {
    Youtubeapidata({
        this.kind,
        this.etag,
        this.items,
        this.pageInfo,
    });

    String? kind;
    String? etag;
    List<Item>? items;
    PageInfo? pageInfo;

    factory Youtubeapidata.fromJson(Map<String, dynamic> json) => Youtubeapidata(
        kind: json["kind"],
        etag: json["etag"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        pageInfo: PageInfo.fromJson(json["pageInfo"]),
    );

    Map<String, dynamic> toJson() => {
        "kind": kind,
        "etag": etag,
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
        "pageInfo": pageInfo!.toJson(),
    };
}

class Item {
    Item({
        this.kind,
        this.etag,
        this.id,
        this.snippet,
        this.contentDetails,
        this.statistics,
    });

    String? kind;
    String? etag;
    String? id;
    Snippet? snippet;
    ContentDetails? contentDetails;
    Statistics? statistics;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        kind: json["kind"],
        etag: json["etag"],
        id: json["id"],
        snippet: Snippet.fromJson(json["snippet"]),
        contentDetails: ContentDetails.fromJson(json["contentDetails"]),
        statistics: Statistics.fromJson(json["statistics"]),
    );

    Map<String, dynamic> toJson() => {
        "kind": kind,
        "etag": etag,
        "id": id,
        "snippet": snippet!.toJson(),
        "contentDetails": contentDetails!.toJson(),
        "statistics": statistics!.toJson(),
    };
}

class ContentDetails {
    ContentDetails({
        this.duration,
        this.dimension,
        this.definition,
        this.caption,
        this.licensedContent,
        this.contentRating,
        this.projection,
      
    });

    String? duration;
    String? dimension;
    String? definition;
    String? caption;
    bool? licensedContent;
    ContentRating? contentRating;
    String? projection;
    

    factory ContentDetails.fromJson(Map<String, dynamic> json) => ContentDetails(
        duration: json["duration"],
        dimension: json["dimension"],
        definition: json["definition"],
        caption: json["caption"],
        licensedContent: json["licensedContent"],
        contentRating: ContentRating.fromJson(json["contentRating"]),
        projection: json["projection"],
       
    );

    Map<String, dynamic> toJson() => {
        "duration": duration,
        "dimension": dimension,
        "definition": definition,
        "caption": caption,
        "licensedContent": licensedContent,
        "contentRating": contentRating!.toJson(),
        "projection": projection,
       
    };
}

class ContentRating {
    ContentRating();

    factory ContentRating.fromJson(Map<String, dynamic> json) => ContentRating(
    );

    Map<String, dynamic> toJson() => {
    };
}



class Snippet {
    Snippet({
        this.publishedAt,
        this.channelId,
        this.title,
        this.description,
        this.thumbnails,
        this.channelTitle,
        
        this.categoryId,
        this.liveBroadcastContent,
        this.localized,
        this.defaultAudioLanguage,
        this.defaultLanguage,
    });

    DateTime? publishedAt;
    String? channelId;
    String? title;
    String? description;
    Thumbnails? thumbnails;
    String? channelTitle;
    
    String? categoryId;
    String? liveBroadcastContent;
    Localized? localized;
    String ?defaultAudioLanguage;
    String? defaultLanguage;

    factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
        publishedAt: DateTime.parse(json["publishedAt"]),
        channelId: json["channelId"],
        title: json["title"],
        description: json["description"],
        thumbnails: Thumbnails.fromJson(json["thumbnails"]),
        channelTitle: json["channelTitle"],
        
        categoryId: json["categoryId"],
        liveBroadcastContent: json["liveBroadcastContent"],
        localized: Localized.fromJson(json["localized"]),
        defaultAudioLanguage: json["defaultAudioLanguage"],
        defaultLanguage: json["defaultLanguage"] == null ? null : json["defaultLanguage"],
    );

    Map<String, dynamic> toJson() => {
        "publishedAt": publishedAt!.toIso8601String(),
        "channelId": channelId,
        "title": title,
        "description": description,
        "thumbnails": thumbnails!.toJson(),
        "channelTitle": channelTitle,
        
        "categoryId": categoryId,
        "liveBroadcastContent": liveBroadcastContent,
        "localized": localized!.toJson(),
        "defaultAudioLanguage": defaultAudioLanguage,
        "defaultLanguage": defaultLanguage == null ? null : defaultLanguage,
    };
}

class Localized {
    Localized({
        this.title,
        this.description,
    });

    String? title;
    String? description;

    factory Localized.fromJson(Map<String, dynamic> json) => Localized(
        title: json["title"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
    };
}

class Thumbnails {
    Thumbnails({
        this.thumbnailsDefault,

    });

    Default? thumbnailsDefault;


    factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
        thumbnailsDefault: Default.fromJson(json["default"]),

    );

    Map<String, dynamic> toJson() => {
        "default": thumbnailsDefault!.toJson(),

    };
}

class Default {
    Default({
        this.url,
        this.width,
        this.height,
    });

    String? url;
    int? width;
    int? height;

    factory Default.fromJson(Map<String, dynamic> json) => Default(
        url: json["url"],
        width: json["width"],
        height: json["height"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
    };
}

class Statistics {
    Statistics({
        this.viewCount,
        this.likeCount,
        this.favoriteCount,
        this.commentCount,
    });

    String? viewCount;
    String? likeCount;
    String? favoriteCount;
    String? commentCount;

    factory Statistics.fromJson(Map<String, dynamic> json) => Statistics(
        viewCount: json["viewCount"],
        likeCount: json["likeCount"],
        favoriteCount: json["favoriteCount"],
        commentCount: json["commentCount"],
    );

    Map<String, dynamic> toJson() => {
        "viewCount": viewCount,
        "likeCount": likeCount,
        "favoriteCount": favoriteCount,
        "commentCount": commentCount,
    };
}

class PageInfo {
    PageInfo({
        this.totalResults,
        this.resultsPerPage,
    });

    int? totalResults;
    int? resultsPerPage;

    factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
        totalResults: json["totalResults"],
        resultsPerPage: json["resultsPerPage"],
    );

    Map<String, dynamic> toJson() => {
        "totalResults": totalResults,
        "resultsPerPage": resultsPerPage,
    };
}
