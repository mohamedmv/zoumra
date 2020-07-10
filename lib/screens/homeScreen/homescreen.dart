import 'package:flutter/material.dart';

import 'package:zoumra/Models/userdata.dart';
import 'package:zoumra/screens/homeScreen/mydrawer.dart';
import 'package:zoumra/screens/homeScreen/mylist.dart';
import 'package:zoumra/services/database.dart';
import 'package:zoumra/shared/Loading.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> bloodtypes = ['All', 'O','A+','AB+','A-'];
    String _bloodtype = 'All';
  @override
  Widget build(BuildContext context) {
   

    Mylist list = Mylist();

   
      
    
    return  Scaffold(
            backgroundColor: Colors.grey[400],
           
            appBar: AppBar(
              actions: <Widget>[
                Container(
                  
                  padding: EdgeInsets.all(5),
                  child: DropdownButton(
                  
                   
                    items: bloodtypes.map((String type){
                      return DropdownMenuItem(
                        child: Text(type, style: TextStyle( fontWeight: FontWeight.bold, fontSize:20 , color: Colors.black),),
                        value:type,
                        );
                    }).toList()
                    ,
                  value:_bloodtype
                   ,onChanged: (s){
                     setState(() {
                       _bloodtype= s;
                     });
                     print(s);
                     
                   }),
                ),
              ],
              backgroundColor:Colors.deepPurple[400] ,
              title: Text('HomeScreen')

            ),
            drawer: Drawer( 
             
                child: Mydrawer()),
            
            body: StreamBuilder<List<Userdata>>(
        stream: DatabaseService().userslist(_bloodtype) ,
        builder: (context, snapshot) {
             
             List<Userdata> userslist= snapshot.data;
         if(snapshot.hasData){return Container(
              child: list.creatlist(userslist),
              
            );
            
            }else{
            
            return Loading();
            }
            }),

            floatingActionButton: StreamBuilder<User>(
              stream: DatabaseService().user,
              builder: (context, snapshot) {
                double b = 1.0;
                if(snapshot.hasData && snapshot.data.uid != null){
                  b = 0.0;
                }
                return Opacity(
                  opacity:b,
                   child: FloatingActionButton(
                    child: Icon(Icons.add) ,
                    backgroundColor: Colors.deepPurple[400],
                    onPressed: (){
                    if(b == 1.0) { Navigator.pushNamed(context, '/signin');}
                    }),
                );
              }
            ),

          );
          }
       
  }

 
