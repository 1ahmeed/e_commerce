import 'change_cart_data.dart';

class Data {
  Data({
      this.id, 
      this.quantity, 
      this.product,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    quantity = json['quantity'];
    product = json['product'] != null ? ChangeCartData.fromJson(json['product']) : null;
  }
  int? id;
  int? quantity;
  ChangeCartData? product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['quantity'] = quantity;
    if (product != null) {
      map['product'] = product!.toJson();
    }
    return map;
  }

}