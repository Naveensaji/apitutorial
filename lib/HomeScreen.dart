


import 'dart:convert';
import 'dart:ui';

import 'package:apisample/model/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<User>users=[];

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text('Rest API sample'),
      ),
     floatingActionButton: FloatingActionButton(onPressed: fetchusers),
     body: ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user=users[index];
        final email=user.email;
        final color=user.gender=='male'?Colors.grey :Colors.grey.shade200;     
       return ListTile(
        tileColor: color,
        title: Text(user.name.first),
        subtitle: Text(email),
       );
     },),
    );
  }

  void fetchusers()async{
    print('fetchusers called');
    const url='https://randomuser.me/api/?results=100';
    final  uri=Uri.parse(url);
    final  response= await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results= json['results'] as List<dynamic>;
    final transorfmed=results.map((temp) {
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
    setState(() {
      users=transorfmed;
    });
    print('fetching completed');
  }
}