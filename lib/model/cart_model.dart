class Carts {

  int? subCategoriesId;
  int? quantity;
  double? price;
  double? total;
  Carts(
      { this.subCategoriesId, this.quantity, this.price, this.total, });

  Carts.fromJson(Map<String, dynamic> json) {

    subCategoriesId = json['sub_categories_id'];
    quantity = json['quantity'];
    price = json['price'];
    total = json['total'];

  }
}