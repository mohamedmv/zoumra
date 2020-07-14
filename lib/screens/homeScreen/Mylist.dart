import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoumra/Models/userdata.dart';


class Mylist{

  ListView creatlist(List<Userdata> data){
    
    
    return ListView.builder(
      itemCount:data.length ,
      itemBuilder: (context,index){
        return Container(
          
          child: Card(
            
                
                elevation: 18.0,
                margin: EdgeInsets.only(right:5,left:5,top: 2,bottom: 2),
               child: ListTile(
                  leading: Icon(Icons.person),
                 onTap: (){
                  
                   Navigator.pushNamed(context, '/info',arguments: { 
                    'nom': data[index].nom,
                    'prenom': data[index].prenom,
                    'numero' : data[index].number,
                    'bloodtype': data[index].bloodtype,
                    'city' : data[index].city

                   });
                 },
                 title: Text('${data[index].nom} ${data[index].prenom}',
                 style: TextStyle(letterSpacing: 0.5 )
                 
                 ),
                 trailing: Container(
                     width: 70,
                     height:90,
                     child: Center(
                             
                             child:Hero(
                               tag: '${data[index].number}',
                                      child: Text('${data[index].bloodtype}',
                           style: TextStyle(
                                 fontSize:24,
                                 color: Colors.orangeAccent[700],
                                 fontWeight: FontWeight.w600
                           ),
                           ),
                             ),
                             
                           
                           ),
                   ),
                
                
                
                
               ),
              
            
          ),
        );






      },
    
    );
  }
}