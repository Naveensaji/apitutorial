import 'package:apisample/model/user_name.dart';

class User{
  final String gender;
  final String email;
  final String phone;
  final String nat;
  final String cell;
  final UserName name;

  User( {
      required this.gender,
      required this.email,
      required this.phone,
      required this.nat, 
      required this.cell,
      required this.name
  });

  String get  fullname{
    return '${name.title} ${name.first}${name.last}';
  }
}
