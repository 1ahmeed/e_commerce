import 'user_model.dart';

class ProfileModel {
  ProfileModel({
      this.status, 
      this.message, 
      this.data,});

  ProfileModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserModel.fromJson(json['data']) : null;
  }
  bool? status;
  dynamic message;
  UserModel? data;

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