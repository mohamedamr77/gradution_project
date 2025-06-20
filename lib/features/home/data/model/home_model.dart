class HomeModel {
  HomeModel({
      this.success, 
      this.data,});

  HomeModel.fromJson(dynamic json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? success;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.rows, 
      this.rowCount,});

  Data.fromJson(dynamic json) {
    if (json['rows'] != null) {
      rows = [];
      json['rows'].forEach((v) {
        rows?.add(Rows.fromJson(v));
      });
    }
    rowCount = json['rowCount'];
  }
  List<Rows>? rows;
  num? rowCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (rows != null) {
      map['rows'] = rows?.map((v) => v.toJson()).toList();
    }
    map['rowCount'] = rowCount;
    return map;
  }

}

class Rows {
  Rows({
      this.userId, 
      this.firstName, 
      this.lastName, 
      this.email, 
      this.phoneNumber, 
      this.imageUrl, 
      this.role, 
      this.createdAt,});

  Rows.fromJson(dynamic json) {
    userId = json['user_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    imageUrl = json['image_url'];
    role = json['role'];
    createdAt = json['created_at'];
  }
  num? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  dynamic imageUrl;
  String? role;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = userId;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['email'] = email;
    map['phone_number'] = phoneNumber;
    map['image_url'] = imageUrl;
    map['role'] = role;
    map['created_at'] = createdAt;
    return map;
  }

}