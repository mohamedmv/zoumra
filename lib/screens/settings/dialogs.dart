import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoumra/Models/userdata.dart';
import 'package:zoumra/screens/settings/myBloodtypeRadioBox.dart';
import 'package:zoumra/services/database.dart';

import 'MyCityRadioBox.dart';

class Dialogs{

  // nom dialogs for name setting
  void  nomDialog(BuildContext context ,Userdata userdata,DatabaseService database){

    showDialog(
      context: context,
      builder: (context) {
        String nom;
        return SimpleDialog(
          
          contentPadding: EdgeInsets.all(10),
          title: Text('Nom'),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                initialValue: nom ?? userdata.nom,
                 decoration :InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                ),
                onChanged: (val){
                  nom = val;
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
            
              children:<Widget>[
                SimpleDialogOption(
                  child: Text('save',style: TextStyle(color:Colors.blue , fontSize: 17.0),),
                  onPressed: () async{
                   Userdata _userdata = Userdata(
                     nom: nom ?? userdata.nom,
                     prenom: userdata.prenom,
                     city: userdata.city,
                     bloodtype: userdata.bloodtype,
                     number: userdata.number,
                   );
                    Navigator.pop(context);
                    await database.updateInformation(_userdata);
                   
                  },
                  ),

                  SimpleDialogOption(
                  child: Text('cancel',style: TextStyle(color:Colors.red , fontSize: 17.0),),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  ),
              ]
            )
          ],
        );
      },
      
      );
  }
 
 // prenom dialoge for prenon setting
  void  prenomDialog(BuildContext context ,Userdata userdata,DatabaseService database){

    showDialog(
      context: context,
      builder: (context) {
        String prenom;
        return SimpleDialog(
          
          contentPadding: EdgeInsets.all(10),
          title: Text('Prenom'),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                initialValue: prenom ?? userdata.prenom,
                 decoration :InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                ),
                onChanged: (val){
                  prenom = val;
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
            
              children:<Widget>[
                SimpleDialogOption(
                  child: Text('save',style: TextStyle(color:Colors.blue , fontSize: 17.0),),
                  onPressed: () async{
                   Userdata _userdata = Userdata(
                     nom: userdata.nom,
                     prenom:prenom ?? userdata.prenom,
                     city: userdata.city,
                     bloodtype: userdata.bloodtype,
                     number: userdata.number,
                   );
                    Navigator.pop(context);
                    await database.updateInformation(_userdata);
                   
                  },
                  ),

                  SimpleDialogOption(
                  child: Text('cancel',style: TextStyle(color:Colors.red , fontSize: 17.0),),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  ),
              ]
            )
          ],
        );
      },
      
      );
  }


 //number dialog for number setting
  void  numberDialog(BuildContext context ,Userdata userdata,DatabaseService database){

    showDialog(
      context: context,
      builder: (context) {
        String number;
        return SimpleDialog(
          
          contentPadding: EdgeInsets.all(10),
          title: Text('Numero'),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                initialValue: number ?? userdata.number,
                 decoration :InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                ),
                onChanged: (val){
                  number = val;
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
            
              children:<Widget>[
                SimpleDialogOption(
                  child: Text('save',style: TextStyle(color:Colors.blue , fontSize: 17.0),),
                  onPressed: () async{
                   Userdata _userdata = Userdata(
                     nom: userdata.nom,
                     prenom: userdata.prenom,
                     city: userdata.city,
                     bloodtype: userdata.bloodtype,
                     number: number ?? userdata.number,
                   );
                    Navigator.pop(context);
                    await database.updateInformation(_userdata);
                   
                  },
                  ),

                  SimpleDialogOption(
                  child: Text('cancel',style: TextStyle(color:Colors.red , fontSize: 17.0),),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  ),
              ]
            )
          ],
        );
      },
      
      );
  }



     // Bloodtype dialog for bloodtype setting
      void  bloodtypeDialog(BuildContext context ,List<String> list,Userdata userdata,DatabaseService database){

    showDialog(
      context: context,
      builder: (context) {
        int ini;
         switch (userdata.bloodtype) {
            case 'O' : ini =0;break;
             case 'A+' : ini =1;break;
              case 'AB+' : ini =2;break;
               case 'A-' : ini =3;break;

            default: ini = 0;
          }
          int go;
          void changego(int g){
               go =g;
          }
       
        return SimpleDialog(
        backgroundColor: Colors.blueGrey[50],
         
          
          contentPadding: EdgeInsets.all(10),
          title: Text('Type sanguin'),
          children: <Widget>[
             MyRadioBox(list: list, ini:ini, changegoo: changego,),
           
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
            
              children:<Widget>[
                SimpleDialogOption(
                  child: Text('save',style: TextStyle(color:Colors.blue , fontSize: 17.0),),
                  onPressed: () async{
                   Userdata _userdata = Userdata(
                     nom: userdata.nom,
                     prenom: userdata.prenom,
                     city: userdata.city,
                     bloodtype: list[go] ?? userdata.bloodtype,
                     number:  userdata.number,
                   );
                    Navigator.pop(context);
                    await database.updateInformation(_userdata);
                   
                  },
                  ),

                  SimpleDialogOption(
                  child: Text('cancel',style: TextStyle(color:Colors.red , fontSize: 17.0),),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  ),
              ]
            )
          ],
        );
      },
      
      );
  }



   
      // city dialoge for city setting
       void  cityDialog(BuildContext context ,List<String> list,Userdata userdata,DatabaseService database){

    showDialog(
      context: context,
      builder: (context) {
        int init;
         switch (userdata.city) {
            case 'NKTT' : init =0;break;
             case 'NDB' : init =1;break;
             

            default: init = 0;
          }
          int go;
          void changego(int g){
               go =g;
          }
       
        return SimpleDialog(
        backgroundColor: Colors.blueGrey[50],
         
          
          contentPadding: EdgeInsets.all(10),
          title: Text('Ville'),
          children: <Widget>[
             MyCityRadioBox(list: list, ini:init, changegoo: changego,),
           
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
            
              children:<Widget>[
                SimpleDialogOption(
                  child: Text('save',style: TextStyle(color:Colors.blue , fontSize: 17.0),),
                  onPressed: () async {
                   Userdata _userdata = Userdata(
                     nom: userdata.nom,
                     prenom: userdata.prenom,
                     city: list[go] ?? userdata.city,
                     bloodtype: userdata.bloodtype,
                     number:  userdata.number,
                   );
                   Navigator.pop(context);
                await database.updateInformation(_userdata);
                     
                   
                  },
                  ),

                  SimpleDialogOption(
                  child: Text('cancel',style: TextStyle(color:Colors.red , fontSize: 17.0),),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  ),
              ]
            )
          ],
        );
      },
      
      );
  }
   }