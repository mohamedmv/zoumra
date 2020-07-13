import 'package:flutter/material.dart';
import 'package:zoumra/Models/userdata.dart';
import 'package:zoumra/services/database.dart';
import 'package:zoumra/shared/Loading.dart';

import 'nonconnectedDrawer.dart';

class Mydrawer extends StatefulWidget {
  @override
  _MydrawerState createState() => _MydrawerState();
}

class _MydrawerState extends State<Mydrawer> {
  @override
  Widget build(BuildContext context) {
    
   Userdata me;
   
    return StreamBuilder(

             stream: DatabaseService().user ,

          builder:(context,snapshot1){

          if(snapshot1.hasData){  print('${snapshot1.data.uid}'); return  StreamBuilder<Userdata>(
        stream: DatabaseService(uid: snapshot1.data.uid).curentUserdata,
        builder: (context, snapshot) {
            me = snapshot.data;
           
         if(snapshot.hasData){ return ListView(
               
            children: <Widget>[
              DrawerHeader(
               decoration: BoxDecoration(
                 gradient: LinearGradient(colors: <Color>[
                  Colors.purple[900],
                  Colors.purple[500],
                  
                 ]),
               ),
                
                  child: Column(
                    children: <Widget>[
                     
                      
                      
                       
                         
                           Container(
                             decoration: BoxDecoration(
                               border: Border(bottom: BorderSide())
                             ),
                             child: Text("${me.bloodtype}",
                             style: TextStyle( 
                               fontSize: 80,
                               color: Colors.blue
                             ),
                             
                             ),
                           ),
                         
                       
                       
                     
                    
                      Text('${me.nom} ${me.prenom}' ,
                      style: TextStyle(
                        fontSize:  15,
                        
                        letterSpacing: 0.5,
                        color: Colors.white
                        

                      ),
                      
                      ),
                      
                    ],
                  ),
                
                ),
                 
                 // liste tile for settings
                 Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border:Border(bottom: BorderSide(color: Colors.grey[400]))
                  ),
                  child: ListTile(
                    onTap: (){
                      Navigator.pushNamed(context, '/settings');
                    },
                    leading: Icon(Icons.settings),
                    title: Text('Settings')
                  ),
                ),


                 Container(
                   margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border:Border(bottom: BorderSide(color: Colors.grey[400]))
                  ),
                  child: ListTile(
                    onTap: (){
                      showDialog(
                        context: context,
                        child: AlertDialog(
                          title : Row(
                            children: <Widget>[
                              Icon(Icons.error_outline),
                              Text('Vous etes sure?'),
                            ],
                            ),
                            actions: <Widget>[
                              FlatButton( 
                                  
                                  onPressed: ()async{  await DatabaseService().signOut(); Navigator.pop(context);}, 
                                  child: Text('Sign out' , style: TextStyle(color:Colors.red),)),
                                   FlatButton( 
                                 
                                  onPressed: (){Navigator.pop(context);}, 
                                  child: Text('cancel')),
                             
                            ],
                        )
                        );
                     
                    },
                    leading: Icon(Icons.person_outline),
                    title: Text('sign out')
                  ),
                ),


                 Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border:Border(bottom: BorderSide(color: Colors.grey[400]))
                  ),
                  child: ListTile(
                    onTap: (){},
                    leading: Icon(Icons.info_outline),
                    title: Text('aboute')
                  ),
                ),
               
                
            ],
          );}else{
        return  Loading();
      }
        }
      );}else{
      return NonConnectedDrawer();
    }
          });
   

      
  }
}