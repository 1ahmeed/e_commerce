

import 'banners_data.dart';

class BannersModel {
  BannersModel({
      this.status, 
      this.message, 
      this.data,});

  BannersModel.fromJson(Map<String,dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(BannersData.fromJson(v));
      });
    }
  }
  bool? status;
  dynamic message;
  List<BannersData>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}