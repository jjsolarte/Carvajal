import 'package:carvajal/features/models/user.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Boxes{
  static Box<User> getUsers() => Hive.box<User>('users');
}