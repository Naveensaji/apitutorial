import 'package:apisample/model/user_dob.dart';
import 'package:apisample/model/user_location.dart';
import 'package:apisample/model/user_name.dart';

class User{
  final String gender;
  final String email;
  final String phone;
  final String nat;
  final String cell;
  final UserName name;
  final UserDob dob;
  final UserLocation location;

  User( {
      required this.gender,
      required this.email,
      required this.phone,
      required this.nat, 
      required this.cell,
      required this.name,
      required this.dob,
      required this.location
  });

  factory User.fromMap(Map<String,dynamic>temp){
    

      final name=UserName.fromMap(temp['name']);
      final dob= UserDob.fromMap(temp['dob']);
      final location=UserLocation.fromMap(temp['location']);

        return User(
        gender: temp['gender'], 
        email: temp['email'], 
        phone: temp['phone'], 
        nat: temp['nat'], 
        cell: temp['cell'],
        name: name,
        dob: dob,
        location: location
        );

  }

  String get  fullname{
    return '${name.title} ${name.first}${name.last}';
  }
}
