import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zoumra/Models/userdata.dart';
import 'package:zoumra/services/database.dart';
import 'package:zoumra/shared/Loading.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String _bloodtype;
  String _city;
  String _nom;
  String _prenom;
  String _number;
  Userdata userdata ;

  String uid;
  bool _loading = false;

   
   List<String> citys = [ 'NKTT','NDB'];
  List<String> bloodtypes = [ 'O','A+','AB+','A-'];
  @override
  Widget build(BuildContext context) {
     if(!_loading) { 
        return StreamBuilder<User>(
       stream: DatabaseService().user,
       builder: (context, snapshot1) {
        User user = snapshot1.data;

         if(snapshot1.hasData){
           DatabaseService _database = DatabaseService(uid: user.uid);
           return StreamBuilder<Userdata>(
       stream: DatabaseService(uid: user.uid).curentUserdata,
       builder: (context, snapshot) {
              userdata = snapshot.data;
         if(snapshot.hasData){return Scaffold(
          appBar:AppBar(
            backgroundColor:Colors.deepPurple[400] ,
            title: Text('Settings'),
          ),
          body: ListView(
            padding: EdgeInsets.all(10),
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  initialValue: userdata.nom ,
                  decoration: InputDecoration(
                    
                    hintText: 'entrez votre nom',
                    labelText: 'Nom',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                  ),
                  onChanged: (val){
                    setState(() => _nom = val);
                  },
                ),
              ),

             
                  Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  initialValue: userdata.prenom,
                  decoration: InputDecoration(
                    hintText: 'entrez votre prenom',
                    labelText: 'Prenom',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                  ),
                   onChanged: (val){
                    setState(() => _prenom = val);
                  },
                  
                  )),
                  
                  Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  initialValue: userdata.number,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'entrez votre numero',
                    labelText: 'Numero',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                  ),
                   onChanged: (val){
                    setState(() => _number = val);
                  },
                  )),
               
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text('Type de san :',style: TextStyle(fontSize: 17),),
                  Container(
                    margin: EdgeInsets.only(left: 20,right: 20),
                    
                    child: DropdownButton(
                     
                      items: bloodtypes.map((String type){
                        return DropdownMenuItem(
                          child: Text(type, style: TextStyle(fontSize:20 , color: Colors.brown),),
                          value:type,
                          );
                      }).toList()
                      ,
                    value:_bloodtype ?? userdata.bloodtype
                     ,onChanged: (s){
                       setState(() {
                         _bloodtype= s;
                       });
                       print(s);
                       
                     }),
                  ),
                ],
              ),
                Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text('Ville :',style: TextStyle(fontSize: 17),),
                  Container(
                    margin: EdgeInsets.only(left: 20,right: 20),
                    
                    child: DropdownButton(
                     
                      items: citys.map((String type){
                        return DropdownMenuItem(
                          child: Text(type, style: TextStyle(fontSize:20 , color: Colors.brown),),
                          value:type,
                          );
                      }).toList()
                      ,
                    value:_city ?? userdata.city
                     ,onChanged: (s){
                       setState(() {
                         _city= s;
                       });
                       print(s);
                       
                     }),
                  ),
                ],
              ),
             Padding(
               padding: const EdgeInsets.all(10.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: <Widget>[
                   Expanded(
                     child: FlatButton(
                     
                     onPressed: () async{
                      
                   
                  // setState(() => _loading = true);
                    Userdata _userdata = Userdata(
                      nom:_nom ?? userdata.nom ,
                       prenom: _prenom ?? userdata.prenom,
                        number: _number ?? userdata.number,
                        city:_city ?? userdata.city,
                        bloodtype:_bloodtype ?? userdata.bloodtype );
                    await _database.updateInformation( _userdata);
                    Navigator.pop(context);
                   }, 
                   child: Text('confirme',
                     style: TextStyle(color: Colors.white , fontSize: 17 ,letterSpacing: 1),
                   ), 
                   
                   color: Colors.purple[900],)),
                  
                   Expanded(child: FlatButton(onPressed: (){Navigator.pop(context, true);},
                    child: Text('Cancel',
                    style: TextStyle(color: Colors.white , fontSize: 17 ,letterSpacing: 1),
                   ),color:Colors.deepOrange[800]) ),
                  

                 ],
               ),
             )
            ],
          ),
    );}else return Loading();
       }
     );}else return Loading();
       }); 
     }else return Loading();
    
  }

 
}