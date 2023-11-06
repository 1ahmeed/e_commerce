class BannersData {
  BannersData({
      this.id, 
      this.image, 
      this.category, 
      this.product,});

  BannersData.fromJson(Map<String,dynamic> json) {
    id = json['id'];
    image = json['image'];
    category = json['category'];
    product = json['product'];
  }
  num? id;
  String? image;
  dynamic category;
  dynamic product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image'] = image;
    map['category'] = category;
    map['product'] = product;
    return map;
  }

}