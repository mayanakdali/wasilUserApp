class Banner {
  Data? data;
  bool? status;
  String? stateNum;
  String? message;

  Banner({this.data, this.status, this.stateNum, this.message});

  Banner.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
    stateNum = json['stateNum'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    data['stateNum'] = this.stateNum;
    data['message'] = this.message;
    return data;
  }
}

class Data {
  List<Banners>? banners;

  Data({this.banners});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = <Banners>[];
      json['banners'].forEach((v) {
        banners!.add(new Banners.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.banners != null) {
      data['banners'] = this.banners!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Banners {
  int? id;
  String? url;
  String? type;
  String? createdAt;
  String? updatedAt;

  Banners({this.id, this.url, this.type, this.createdAt, this.updatedAt});

  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
