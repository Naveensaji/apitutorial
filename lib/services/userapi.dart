

import 'package:apisample/model/user.dart';

import 'package:http/http.dart'as http;

import 'dart:convert';


class UserApli{
  
static Future< List<User>> fetchusers()async{
  //  print('fetchusers called');
    const url='https://randomuser.me/api/?results=100';
    final  uri=Uri.parse(url);
    final  response= await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results= json['results'] as List<dynamic>;


    final users=results.map((temp) {
   return User.fromMap(temp);
      }).toList();

   return  users;
   // print('fetching completed');
  }
}