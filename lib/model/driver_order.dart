class DriverOrder {
  int? categoryId;
  int? paymentType;
  String? orderType;
  String? orderDate;
  String? orderTimeFrom;
  String? orderTimeTo;
  int? expeditedFees;
  int? order;
  int? deliveryFee;
  double? total;
  String? couponDiscount;
  String? couponId;
  int? addressId;
  int? type;
  String? deliveryIds;
  int? count;
  bool? nightOrder;
  double? commesion;
  List<Carts>? carts;

  DriverOrder(
      {this.categoryId,
      this.paymentType,
      this.orderType,
      this.orderDate,
      this.orderTimeFrom,
      this.orderTimeTo,
      this.expeditedFees,
      this.order,
      this.deliveryFee,
      this.total,
      this.couponDiscount,
      this.couponId,
      this.addressId,
      this.type,
      this.deliveryIds,
      this.count,
      this.nightOrder,
      this.commesion,
      this.carts});

  DriverOrder.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    paymentType = json['payment_type'];
    orderType = json['order_type'];
    orderDate = json['order_date'];
    orderTimeFrom = json['order_time_from'];
    orderTimeTo = json['order_time_to'];
    expeditedFees = json['expedited_fees'];
    order = json['order'];
    deliveryFee = json['delivery_fee'];
    total = json['total'];
    couponDiscount = json['coupon_discount'];
    couponId = json['coupon_id'];
    addressId = json['address_id'];
    type = json['type'];
    deliveryIds = json['deliveryIds'];
    count = json['count'];
    nightOrder = json['night_order'];
    commesion = json['commesion'];
    if (json['carts'] != null) {
      carts = <Carts>[];
      json['carts'].forEach((v) {
        carts!.add(Carts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['payment_type'] = paymentType;
    data['order_type'] = orderType;
    data['order_date'] = orderDate;
    data['order_time_from'] = orderTimeFrom;
    data['order_time_to'] = orderTimeTo;
    data['expedited_fees'] = expeditedFees;
    data['order'] = order;
    data['delivery_fee'] = deliveryFee;
    data['total'] = total;
    data['coupon_discount'] = couponDiscount;
    data['coupon_id'] = couponId;
    data['address_id'] = addressId;
    data['type'] = type;
    data['deliveryIds'] = deliveryIds;
    data['count'] = count;
    data['night_order'] = nightOrder;
    data['commesion'] = commesion;
    if (carts != null) {
      data['carts'] = carts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Carts {
  int? subCategoriesId;
  int? quantity;
  int? price;
  int? total;

  Carts({this.subCategoriesId, this.quantity, this.price, this.total});

  Carts.fromJson(Map<String, dynamic> json) {
    subCategoriesId = json['sub_categories_id'];
    quantity = json['quantity'];
    price = json['price'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sub_categories_id'] = subCategoriesId;
    data['quantity'] = quantity;
    data['price'] = price;
    data['total'] = total;
    return data;
  }
}
