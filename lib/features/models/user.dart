import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject{
  User({
    this.id,
    this.name,
    this.lastname,
    this.email,
    this.address,
    this.gender,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'] as int?,
    name: json['name']?.toString(),
    address: json['address']?.toString(),
    email: json['email']?.toString(),
    gender: json['gener']?.toString(),
    lastname: json['lastname']?.toString(),
    password: json['password']?.toString(),
  );

  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? lastname;
  @HiveField(3)
  String? email;
  @HiveField(4)
  String? address;
  @HiveField(5)
  String? gender;
  @HiveField(6)
  String? password;
}

