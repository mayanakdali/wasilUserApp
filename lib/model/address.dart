




import '../shared/utils/helper/text.dart';

class UserAddress {
  int id, type;
  String street;
  String? buildingNumber;
  String? name;
  double latitude;
  double longitude;
  String city;
  int apartmentNum;
  bool isDefault, active;

  UserAddress(
      this.id,
      this.street,
      this.buildingNumber,
      this.latitude,
      this.longitude,
      this.city,
      this.apartmentNum,
      this.isDefault,
      this.type,
      this.active);

  static fromJson(Map<String, dynamic> jsonObject) {
    int id = int.parse(jsonObject['id'].toString());
    String street = jsonObject['street'].toString();
    String? buildingNumber;
    if (jsonObject['building_number'].toString().compareTo("null") != 0)
      buildingNumber = jsonObject['building_number'].toString();
    double latitude = double.parse(jsonObject['latitude'].toString());
    double longitude = double.parse(jsonObject['longitude'].toString());
    String city = jsonObject['city'].toString();
    int apartmentNum = int.parse(jsonObject['apartment_num'].toString());
    int type = int.parse(jsonObject['type'].toString());

    bool isDefault = TextUtils.parseBool(jsonObject['default'].toString());
    bool active = TextUtils.parseBool(jsonObject['active'].toString());
    return UserAddress(id, street, buildingNumber, latitude, longitude, city,
        apartmentNum, isDefault, type, active);
  }

  static List<UserAddress> getListFromJson(List<dynamic> jsonArray) {
    List<UserAddress> list = [];
    for (int i = 0; i < jsonArray.length; i++) {
      list.add(UserAddress.fromJson(jsonArray[i]));
    }
    return list;
  }

  @override
  String toString() {
    return 'UserAddress{id: $id, street: $street, buildingNumber: $buildingNumber, latitude: $latitude, longitude: $longitude, city: $city, apartmentNum: $apartmentNum}';
  }

  static const int HOME = 0;
  static const int WORK = 1;
  static const int OTHER = 2;
}
