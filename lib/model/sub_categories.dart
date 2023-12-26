class SubCategories {
  int? id;
  Title? title;
  Title? description;
  double? price;
  dynamic shopId;
  int? categoryId;
  int? active;
  int? isPrimary;
  String? imageUrl;
  int? isApproval;
  int? quantity;
  String? createdAt;
  String? updatedAt;

  SubCategories({
    this.id,
    this.title,
    this.description,
    this.price,
    this.shopId,
    this.categoryId,
    this.active,
    this.isPrimary,
    this.imageUrl,
    this.isApproval,
    this.quantity,
    this.createdAt,
    this.updatedAt,
  });

  SubCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    description = json['description'] != null
        ? Title.fromJson(json['description'])
        : null;
    price = double.parse(json['price'].toString());
    shopId = json['shop_id'];
    categoryId = json['category_id'];
    active = json['active'];
    isPrimary = json['is_primary'];
    imageUrl = json['image_url'];
    isApproval = json['is_approval'];
    quantity = json['quantity'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (title != null) {
      data['title'] = title!.toJson();
    }
    if (description != null) {
      data['description'] = description!.toJson();
    }
    data['price'] = price;
    data['shop_id'] = shopId;
    data['category_id'] = categoryId;
    data['active'] = active;
    data['is_primary'] = isPrimary;
    data['image_url'] = imageUrl;
    data['is_approval'] = isApproval;
    data['quantity'] = quantity;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Title {
  String? en;
  String? ar;

  Title({this.en, this.ar});

  Title.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    ar = json['ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['en'] = en;
    data['ar'] = ar;
    return data;
  }
}
