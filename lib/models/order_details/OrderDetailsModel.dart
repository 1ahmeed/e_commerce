class OrderDetailsModel {
  OrderDetailsModel({
      this.status, 
      this.message, 
      this.data,});

  OrderDetailsModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? status;
  dynamic message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.cost, 
      this.discount, 
      this.points, 
      this.vat, 
      this.total, 
      this.pointsCommission, 
      this.promoCode, 
      this.paymentMethod, 
      this.date, 
      this.status, 
      this.address, 
      this.products,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    cost = json['cost'];
    discount = json['discount'];
    points = json['points'];
    vat = json['vat'];
    total = json['total'];
    pointsCommission = json['points_commission'];
    promoCode = json['promo_code'];
    paymentMethod = json['payment_method'];
    date = json['date'];
    status = json['status'];
    address = json['address'] != null ? Address.fromJson(json['address']) : null;
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
  }
  int? id;
  dynamic cost;
  dynamic discount;
  dynamic points;
  dynamic vat;
  dynamic total;
  dynamic pointsCommission;
  String? promoCode;
  String? paymentMethod;
  String? date;
  String? status;
  Address? address;
  List<Products>? products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['cost'] = cost;
    map['discount'] = discount;
    map['points'] = points;
    map['vat'] = vat;
    map['total'] = total;
    map['points_commission'] = pointsCommission;
    map['promo_code'] = promoCode;
    map['payment_method'] = paymentMethod;
    map['date'] = date;
    map['status'] = status;
    if (address != null) {
      map['address'] = address?.toJson();
    }
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Products {
  Products({
      this.id, 
      this.quantity, 
      this.price, 
      this.name, 
      this.image,});

  Products.fromJson(dynamic json) {
    id = json['id'];
    quantity = json['quantity'];
    price = json['price'];
    name = json['name'];
    image = json['image'];
  }
  int? id;
  int? quantity;
  dynamic price;
  String? name;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['quantity'] = quantity;
    map['price'] = price;
    map['name'] = name;
    map['image'] = image;
    return map;
  }

}

class Address {
  Address({
      this.id, 
      this.name, 
      this.city, 
      this.region, 
      this.details, 
      this.notes, 
      this.latitude, 
      this.longitude,});

  Address.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
    region = json['region'];
    details = json['details'];
    notes = json['notes'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }
  int? id;
  String? name;
  String? city;
  String? region;
  String? details;
  String? notes;
  dynamic latitude;
  dynamic longitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['city'] = city;
    map['region'] = region;
    map['details'] = details;
    map['notes'] = notes;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    return map;
  }

}