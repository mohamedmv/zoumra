import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoumra/Models/user.dart';

class Mylist{

  ListView creatlist(List<User> data){

    return ListView.builder(
      itemCount:data.length ,
      itemBuilder: (context,index){
        return Card(
            
            
            margin: EdgeInsets.only(right:5,left:5,top: 2,bottom: 2),
           child: ListTile(
              leading: Icon(Icons.person),
             onTap: (){},
             title: Text('${data[index].nom} ${data[index].prenom}',
             style: TextStyle(letterSpacing: 0.5 )
             
             ),
             trailing: Text('${data[index].bloodtype}',
             style: TextStyle(
               fontSize:40,
               color: Colors.deepOrange,
               fontWeight: FontWeight.bold
             ),
             
             ),
            
           ),
          
        );
      },
    
    );
  }
}