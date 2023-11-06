class ChangeFavouriteData {
  ChangeFavouriteData({
      this.id, 
      this.price, 
      this.oldPrice, 
      this.discount, 
      this.image,});

  ChangeFavouriteData.fromJson(dynamic json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
  }
  int? id;
  num? price;
  num? oldPrice;
  num? discount;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['price'] = price;
    map['old_price'] = oldPrice;
    map['discount'] = discount;
    map['image'] = image;
    return map;
  }

}