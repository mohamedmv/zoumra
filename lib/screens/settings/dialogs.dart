import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoumra/Models/userdata.dart';
import 'package:zoumra/services/database.dart';

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
                  child: Text('save',style: TextStyle(color:Colors.blue),),
                  onPressed: () async{
                   Userdata _userdata = Userdata(
                     nom: nom ?? userdata.nom,
                     prenom: userdata.prenom,
                     city: userdata.city,
                     bloodtype: userdata.bloodtype,
                     number: userdata.number,
                   );
                    await database.updateInformation(_userdata);
                    Navigator.pop(context);
                  },
                  ),

                  SimpleDialogOption(
                  child: Text('cancel',style: TextStyle(color:Colors.red),),
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
                  child: Text('save',style: TextStyle(color:Colors.blue),),
                  onPressed: () async{
                   Userdata _userdata = Userdata(
                     nom: userdata.nom,
                     prenom:prenom ?? userdata.prenom,
                     city: userdata.city,
                     bloodtype: userdata.bloodtype,
                     number: userdata.number,
                   );
                    await database.updateInformation(_userdata);
                    Navigator.pop(context);
                  },
                  ),

                  SimpleDialogOption(
                  child: Text('cancel',style: TextStyle(color:Colors.red),),
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
                initialValue: number ?? userdata.prenom,
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
                  child: Text('save',style: TextStyle(color:Colors.blue),),
                  onPressed: () async{
                   Userdata _userdata = Userdata(
                     nom: userdata.nom,
                     prenom: userdata.prenom,
                     city: userdata.city,
                     bloodtype: userdata.bloodtype,
                     number: number ?? userdata.number,
                   );
                    await database.updateInformation(_userdata);
                    Navigator.pop(context);
                  },
                  ),

                  SimpleDialogOption(
                  child: Text('cancel',style: TextStyle(color:Colors.red),),
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