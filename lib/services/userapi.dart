import 'package:apisample/model/user.dart';
import 'package:apisample/model/user_name.dart';
import 'package:http/http.dart'as http;

import 'dart:convert';


class UserApli{
  
static Future< List<User>> fetchusers()async{
    print('fetchusers called');
    const url='https://randomuser.me/api/?results=100';
    final  uri=Uri.parse(url);
    final  response= await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results= json['results'] as List<dynamic>;
    final users=results.map((temp) {
      final name=UserName(
        title: temp['name']['title'], 
        first: temp['name']['first'],  
        last: temp['name']['last'], );
        return User(
        gender: temp['gender'], 
        email: temp['email'], 
        phone: temp['phone'], 
        nat: temp['nat'], 
        cell: temp['cell'],
        name: name
        );
      }).toList();

   return  users;
   // print('fetching completed');
  }
}