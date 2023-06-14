import 'package:apisample/model/user.dart';
import 'package:apisample/services/userapi.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<User>users=[];
  @override
  void initState() {
    super.initState();
    fetchusers();
  }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text('Rest API sample'),
      ),
    
     body: ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user=users[index];
        final email=user.email;
        final color=user.gender=='male'?Colors.grey :Colors.grey.shade200;     
       return ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.black,
          child: Text('${index +1}')),
        tileColor: color,
        title: Text(user.fullname ),
        subtitle: Text(email),
       );
     },),
    );
  }

  Future<void> fetchusers()async{
 final response=await UserApli.fetchusers();
 setState(() {
   users=response;
 });
  }

  
}