class Photo {
  Photo({
    this.id,
    this.owner,
    this.secret,
    this.server,
    this.farm,
    this.title,
    this.ispublic,
    this.isfriend,
    this.isfamily,
  });

  String? id;
  String? owner;
  String? secret;
  String? server;
  int? farm;
  String? title;
  int? ispublic;
  int? isfriend;
  int? isfamily;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["id"],
        owner: json["owner"],
        secret: json["secret"],
        server: json["server"],
        farm: json["farm"],
        title: json["title"],
        ispublic: json["ispublic"],
        isfriend: json["isfriend"],
        isfamily: json["isfamily"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "owner": owner,
        "secret": secret,
        "server": server,
        "farm": farm,
        "title": title,
        "ispublic": ispublic,
        "isfriend": isfriend,
        "isfamily": isfamily,
      };
}
