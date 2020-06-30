import 'package:flutter/material.dart';
import 'package:zoumra/Models/user.dart';
import 'package:zoumra/screens/homeScreen/mydrawer.dart';
import 'package:zoumra/screens/homeScreen/mylist.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    Mylist list = Mylist();

    List<User> userslist= [
       User(nom:'Med',prenom: 'Mahmoud',bloodtype: 'O    ',number: 32324252),
         User(nom:'Sara',prenom: 'ahmed',bloodtype: 'A+  ',number: 32324252),
      User(nom:'Med',prenom: 'nahoui',bloodtype: 'AB+',number: 43434662),
      User(nom:'med',prenom: 'MV',bloodtype: 'O    ',number: 43434662),
      User(nom:'sidi',prenom: 'ali',bloodtype: 'A+  ',number: 43434662),
      User(nom:'mohamed',prenom: 'ahmedMeddou',bloodtype: 'AB+',number: 43434662),
       User(nom:'sidimed',prenom: 'meddou',bloodtype: 'A-  ',number: 43434662),
      User(nom:'med',prenom: 'Mahmoud',bloodtype: 'O    ',number: 43434662),
      User(nom:'sara',prenom: 'ahmed',bloodtype: 'A+  ',number: 4433662),
       User(nom:'sidimed',prenom: 'meddou',bloodtype: 'A-  ',number: 37994662),
      User(nom:'med',prenom: 'Mahmoud',bloodtype: 'O    ',number: 22334662),
      User(nom:'sara',prenom: 'ahmed',bloodtype: 'A+  ',number: 43434662),
       
    
      ];
      
    
    return Scaffold(
      backgroundColor: Colors.grey[400],
     
      appBar: AppBar(
        backgroundColor:Colors.deepPurple[400] ,
        title: Text('HomeScreen')

      ),
      drawer: Drawer( 
        child: Mydrawer(),
      ),
      body: list.creatlist(userslist),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add) ,
        backgroundColor: Colors.deepPurple[400],
        onPressed: (){
          Navigator.pushNamed(context, '/signin');
        }),

    );
  }

 
}