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
  List<String> bloodtypes =[ 'All','O+','O-','A+','A-','AB+','AB-','B+','B-'];
    String _bloodtype = 'All';
     List<String> citys =[ 'All','NKTT','NDB'];
    String _city = 'All';
  
  @override
  Widget build(BuildContext context) {
   

    Mylist list = Mylist();

   
      
    
    return  Scaffold(
            // backgroundColor: Colors.grey[400],
           
            appBar: AppBar(
              actions: <Widget>[

                //Bloodtype dropdown button
                Container(
                  
                  padding: EdgeInsets.all(5),
                  child: DropdownButton(
                  
                   
                    items: bloodtypes.map((String type){
                      return DropdownMenuItem(
                        child: Text(type, style: TextStyle( fontWeight: FontWeight.bold, fontSize:20 ,),),
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

                //city dropdown button

                  Container(
                  
                  padding: EdgeInsets.all(5),
                  child: DropdownButton(
                  
                   
                    items: citys.map((String type){
                      return DropdownMenuItem(
                        child: Text(type, style: TextStyle( fontWeight: FontWeight.bold, fontSize:20 ,),),
                        value:type,
                        );
                    }).toList()
                    ,
                  value:_city
                   ,onChanged: (s){
                     setState(() {
                       _city= s;
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
        stream: DatabaseService().userslist(_bloodtype,_city) ,
        builder: (context, snapshot) {
             
             List<Userdata> userslist= snapshot.data;
         if(snapshot.hasData){return Container(
              child: userslist == [] ? Loading() : list.creatlist(userslist),
              
            );
            
            }else{
            
            return Loading();
            }
            }),

            floatingActionButton: StreamBuilder<User>(
              stream: DatabaseService().user,
              builder: (context, snapshot) {
                
                if(snapshot.hasData && snapshot.data.uid != null){
                 return SizedBox(height: 0.0,width: 0.0);
                  
                }else{
                   return FloatingActionButton(
                    child: Icon(Icons.add) ,
                    backgroundColor: Colors.deepPurple[400],
                    onPressed: (){
                     Navigator.pushNamed(context, '/signin');
                    }
                );
                }
               
              }
            ),

          );
          }
       
  }

 
