import 'package:flutter/material.dart';
import 'package:zoumra/Models/user.dart';

class Mydrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User me = User(nom:'Mohamed',prenom:'MV',number: 32424566,bloodtype: 'AB+');
   
    return ListView(
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
              onTap: (){},
              leading: Icon(Icons.accessibility_new),
              title: Text('bala alala')
            ),
          ),
           Container(
             margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              border:Border(bottom: BorderSide(color: Colors.grey[400]))
            ),
            child: ListTile(
              onTap: (){},
              leading: Icon(Icons.android),
              title: Text('Home')
            ),
          ),
         
          
      ],
    );
   

      
  }
  
}