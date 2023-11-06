class SearchData {
  SearchData({
      this.id, 
      this.price, 
      this.image, 
      this.name, 
      this.description, 
      this.images, 
      this.inFavorites, 
      this.inCart,});

  SearchData.fromJson(dynamic json) {
    id = json['id'];
    price = json['price'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }
  num? id;
  num? price;
  String? image;
  String? name;
  String? description;
  List<String>? images;
  bool? inFavorites;
  bool? inCart;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['price'] = price;
    map['image'] = image;
    map['name'] = name;
    map['description'] = description;
    map['images'] = images;
    map['in_favorites'] = inFavorites;
    map['in_cart'] = inCart;
    return map;
  }

}