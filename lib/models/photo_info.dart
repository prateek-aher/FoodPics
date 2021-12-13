// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

PhotoInfo welcomeFromJson(String str) => PhotoInfo.fromJson(json.decode(str));

String welcomeToJson(PhotoInfo data) => json.encode(data.toJson());

class PhotoInfo {
  PhotoInfo({
    this.id,
    this.secret,
    this.server,
    this.farm,
    this.dateuploaded,
    this.isfavorite,
    this.license,
    this.safetyLevel,
    this.rotation,
    this.originalsecret,
    this.originalformat,
    this.owner,
    this.title,
    this.description,
    this.views,
    this.comments,
    this.media,
  });

  String? id;
  String? secret;
  String? server;
  int? farm;
  String? dateuploaded;
  int? isfavorite;
  String? license;
  String? safetyLevel;
  int? rotation;
  String? originalsecret;
  String? originalformat;
  Owner? owner;
  Comments? title;
  Comments? description;
  String? views;
  Comments? comments;
  String? media;

  factory PhotoInfo.fromJson(Map<String, dynamic> json) => PhotoInfo(
        id: json["id"],
        secret: json["secret"],
        server: json["server"],
        farm: json["farm"],
        dateuploaded: json["dateuploaded"],
        isfavorite: json["isfavorite"],
        license: json["license"],
        safetyLevel: json["safety_level"],
        rotation: json["rotation"],
        originalsecret: json["originalsecret"],
        originalformat: json["originalformat"],
        owner: json["owner"] == null ? null : Owner.fromJson(json["owner"]),
        title: json["title"] == null ? null : Comments.fromJson(json["title"]),
        description: json["description"] == null
            ? null
            : Comments.fromJson(json["description"]),
        views: json["views"],
        comments: json["comments"] == null
            ? null
            : Comments.fromJson(json["comments"]),
        media: json["media"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "secret": secret,
        "server": server,
        "farm": farm,
        "dateuploaded": dateuploaded,
        "isfavorite": isfavorite,
        "license": license,
        "safety_level": safetyLevel,
        "rotation": rotation,
        "originalsecret": originalsecret,
        "originalformat": originalformat,
        "owner": owner?.toJson(),
        "title": title?.toJson(),
        "description": description?.toJson(),
        "views": views,
        "comments": comments?.toJson(),
        "media": media,
      };
}

class Comments {
  Comments({
    this.content,
  });

  String? content;

  factory Comments.fromJson(Map<String, dynamic> json) => Comments(
        content: json["_content"],
      );

  Map<String, dynamic> toJson() => {
        "_content": content,
      };
}

class Owner {
  Owner({
    this.nsid,
    this.username,
    this.realname,
    this.location,
    this.iconserver,
    this.iconfarm,
    this.pathAlias,
  });

  String? nsid;
  String? username;
  String? realname;
  String? location;
  String? iconserver;
  int? iconfarm;
  dynamic pathAlias;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        nsid: json["nsid"],
        username: json["username"],
        realname: json["realname"],
        location: json["location"],
        iconserver: json["iconserver"],
        iconfarm: json["iconfarm"],
        pathAlias: json["path_alias"],
      );

  Map<String, dynamic> toJson() => {
        "nsid": nsid,
        "username": username,
        "realname": realname,
        "location": location,
        "iconserver": iconserver,
        "iconfarm": iconfarm,
        "path_alias": pathAlias,
      };
}
