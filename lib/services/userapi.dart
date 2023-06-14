

import 'package:apisample/model/user.dart';
import 'package:apisample/model/user_dob.dart';
import 'package:apisample/model/user_location.dart';
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
    final coordinates=LocationCoordinates(
      longitude: temp['location']['coordinates']['longitude'], 
      latitude: temp['location']['coordinates']['latitude']);

      final street=LocationStreet(name: temp['location']['street']['name'], number: temp['location']['street']['number'],) ;

      final timezone=LocationTimeZone(offset: temp['location']['timezone']['offset'],description:  temp['location']['timezone']['description'],);

       final location=UserLocation(
       city: temp['location']['city'], 
       state: temp['location']['state'], 
       country: temp['location']['country'], 
       postcode: temp['location']['postcode'].toString(), 
       coordinates: coordinates, 
       timezone: timezone,
       street: street);

      final name=UserName(
        title: temp['name']['title'], 
        first: temp['name']['first'],  
        last: temp['name']['last'], );
        final date=temp['dob']['date'];
        final dob=  UserDob(
              age: temp['dob']['date'], 
              date: DateTime.parse(date) );
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
      }).toList();

   return  users;
   // print('fetching completed');
  }
}