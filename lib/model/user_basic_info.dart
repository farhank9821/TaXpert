import 'dart:convert';

import 'package:hive/hive.dart';

part 'user_basic_info.g.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
@HiveType(typeId: 0)
class UserBasicInfo {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final int age;

  @HiveField(2)
  final String? email;

  @HiveField(3)
  final String? phoneNo;

  @HiveField(4)
  final String? address;

  UserBasicInfo({
    required this.name,
    required this.age,
    this.email,
    this.phoneNo,
    this.address,
  });

  UserBasicInfo copyWith({
    String? name,
    int? age,
    String? email,
    String? phoneNo,
    String? address,
  }) {
    return UserBasicInfo(
      name: name ?? this.name,
      age: age ?? this.age,
      email: email ?? this.email,
      phoneNo: phoneNo ?? this.phoneNo,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'age': age,
      'email': email,
      'phoneNo': phoneNo,
      'address': address,
    };
  }

  factory UserBasicInfo.fromMap(Map<String, dynamic> map) {
    return UserBasicInfo(
      name: map['name'] as String,
      age: map['age'] as int,
      email: map['email'] as String,
      phoneNo: map['phoneNo'] as String?,
      address: map['address'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserBasicInfo.fromJson(String source) => UserBasicInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserBasicInfo(name: $name, age: $age, email: $email, phoneNo: $phoneNo, address: $address)';
  }

  @override
  bool operator ==(covariant UserBasicInfo other) {
    if (identical(this, other)) return true;

    return other.name == name && other.age == age && other.email == email && other.phoneNo == phoneNo && other.address == address;
  }

  @override
  int get hashCode {
    return name.hashCode ^ age.hashCode ^ email.hashCode ^ phoneNo.hashCode ^ address.hashCode;
  }
}
