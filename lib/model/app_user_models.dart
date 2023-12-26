AppUserData appUserData = AppUserData();

class AppUserData {
  Data? data;
  bool? status;
  String? stateNum;
  String? message;

  AppUserData({this.data, this.status, this.stateNum, this.message});

  AppUserData.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    status = json['status'];
    stateNum = json['stateNum'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = status;
    data['stateNum'] = stateNum;
    data['message'] = message;
    return data;
  }
}

class Data {
  DeliveryBoy? deliveryBoy;
  String? token;

  Data({this.deliveryBoy, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    deliveryBoy = json['deliveryBoy'] != null
        ? DeliveryBoy.fromJson(json['deliveryBoy'])
        : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (deliveryBoy != null) {
      data['deliveryBoy'] = deliveryBoy!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class DeliveryBoy {
  int? id;
  Name? name;
  String? agencyName;
  String? carNumber;
  String? email;
  String? emailVerifiedAt;
  String? password;
  String? fcmToken;
  String? latitude;
  String? longitude;
  int? isFree;
  int? isOffline;
  int? isActive;
  String? avatarUrl;
  String? mobile;
  int? mobileVerified;
  int? rating;
  int? totalRating;
  int? categoryId;
  int? shopId;
  String? rememberToken;
  int? isVerified;
  String? drivingLicense;
  String? carLicense;
  int? isApproval;
  int? distance;
  String? otp;
  int? totalCapacity;
  int? totalQuantity;
  int? availableQuantity;
  String? referrer;
  String? referrerLink;
  String? createdAt;
  String? updatedAt;
  Category? category;

  DeliveryBoy(
      {this.id,
      this.name,
      this.agencyName,
      this.carNumber,
      this.email,
      this.emailVerifiedAt,
      this.password,
      this.fcmToken,
      this.latitude,
      this.longitude,
      this.isFree,
      this.isOffline,
      this.isActive,
      this.avatarUrl,
      this.mobile,
      this.mobileVerified,
      this.rating,
      this.totalRating,
      this.categoryId,
      this.shopId,
      this.rememberToken,
      this.isVerified,
      this.drivingLicense,
      this.carLicense,
      this.isApproval,
      this.distance,
      this.otp,
      this.totalCapacity,
      this.totalQuantity,
      this.availableQuantity,
      this.referrer,
      this.referrerLink,
      this.createdAt,
      this.updatedAt,
      this.category});

  DeliveryBoy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    agencyName = json['agency_name'];
    carNumber = json['car_number'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    password = json['password'];
    fcmToken = json['fcm_token'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    isFree = json['is_free'];
    isOffline = json['is_offline'];
    isActive = json['is_active'];
    avatarUrl = json['avatar_url'];
    mobile = json['mobile'];
    mobileVerified = json['mobile_verified'];
    rating = json['rating'];
    totalRating = json['total_rating'];
    categoryId = json['category_id'];
    shopId = json['shop_id'];
    rememberToken = json['remember_token'];
    isVerified = json['is_verified'];
    drivingLicense = json['driving_license'];
    carLicense = json['car_license'];
    isApproval = json['is_approval'];
    distance = json['distance'];
    otp = json['otp'];
    totalCapacity = json['total_capacity'];
    totalQuantity = json['total_quantity'];
    availableQuantity = json['available_quantity'];
    referrer = json['referrer'];
    referrerLink = json['referrer_link'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    data['agency_name'] = agencyName;
    data['car_number'] = carNumber;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['password'] = password;
    data['fcm_token'] = fcmToken;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['is_free'] = isFree;
    data['is_offline'] = isOffline;
    data['is_active'] = isActive;
    data['avatar_url'] = avatarUrl;
    data['mobile'] = mobile;
    data['mobile_verified'] = mobileVerified;
    data['rating'] = rating;
    data['total_rating'] = totalRating;
    data['category_id'] = categoryId;
    data['shop_id'] = shopId;
    data['remember_token'] = rememberToken;
    data['is_verified'] = isVerified;
    data['driving_license'] = drivingLicense;
    data['car_license'] = carLicense;
    data['is_approval'] = isApproval;
    data['distance'] = distance;
    data['otp'] = otp;
    data['total_capacity'] = totalCapacity;
    data['total_quantity'] = totalQuantity;
    data['available_quantity'] = availableQuantity;
    data['referrer'] = referrer;
    data['referrer_link'] = referrerLink;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }
}

class Name {
  String? en;
  String? ar;

  Name({this.en, this.ar});

  Name.fromJson(Map<String, dynamic> json) {
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

class Category {
  int? id;
  Name? title;
  Name? description;
  int? commesion;
  String? imageUrl;
  String? type;
  int? deliveryFee;
  String? expeditedFees;
  String? schedulerFees;
  String? startWorkTime;
  String? endWorkTime;
  int? active;
  String? createdAt;
  String? updatedAt;

  Category(
      {this.id,
      this.title,
      this.description,
      this.commesion,
      this.imageUrl,
      this.type,
      this.deliveryFee,
      this.expeditedFees,
      this.schedulerFees,
      this.startWorkTime,
      this.endWorkTime,
      this.active,
      this.createdAt,
      this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? Name.fromJson(json['title']) : null;
    description =
        json['description'] != null ? Name.fromJson(json['description']) : null;
    commesion = json['commesion'];
    imageUrl = json['image_url'];
    type = json['type'];
    deliveryFee = json['delivery_fee'];
    expeditedFees = json['expedited_fees'];
    schedulerFees = json['scheduler_fees'];
    startWorkTime = json['start_work_time'];
    endWorkTime = json['end_work_time'];
    active = json['active'];
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
    data['commesion'] = commesion;
    data['image_url'] = imageUrl;
    data['type'] = type;
    data['delivery_fee'] = deliveryFee;
    data['expedited_fees'] = expeditedFees;
    data['scheduler_fees'] = schedulerFees;
    data['start_work_time'] = startWorkTime;
    data['end_work_time'] = endWorkTime;
    data['active'] = active;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
