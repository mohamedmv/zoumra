import 'package:flutter/material.dart';
import 'package:zoumra/Models/userdata.dart';
import 'package:zoumra/services/database.dart';
import 'package:zoumra/shared/Loading.dart';

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

          builder:(context,snapshot){

          if(snapshot.hasData){ return  StreamBuilder<Userdata>(
        stream: DatabaseService(uid: snapshot.data.uid).curentUserdata,
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
                               border: Border(bottom: BorderSide(color: Colors.black26))
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
                Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border:Border(bottom: BorderSide(color: Colors.grey[400]))
                  ),
                  child: ListTile(
                    onTap: (){},
                    leading: Icon(Icons.home),
                    title: Text('Home')
                  ),
                ),
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
                    title: Text('bala alala')
                  ),
                ),
                 Container(
                   margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border:Border(bottom: BorderSide(color: Colors.grey[400]))
                  ),
                  child: ListTile(
                    onTap: (){
                      DatabaseService().signOut();
                    },
                    leading: Icon(Icons.error_outline),
                    title: Text('sign out')
                  ),
                ),
               
                
            ],
          );}else{
        return Loading();
      }
        }
      );}else{
      return Loading();
    }
          });
   

      
  }
}