import 'change_favourite_data.dart';

class Data {
  Data({
      this.id, 
      this.product,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    product = json['product'] != null ? ChangeFavouriteData.fromJson(json['product']) : null;
  }
  num? id;
  ChangeFavouriteData? product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (product != null) {
      map['product'] = product?.toJson();
    }
    return map;
  }

}