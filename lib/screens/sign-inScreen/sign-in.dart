import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zoumra/Models/userdata.dart';
import 'package:zoumra/services/database.dart';
import 'package:zoumra/shared/Loading.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final  _fromkey = GlobalKey<FormState>();


  String _bloodtype = 'A+';
  String _city = 'NKTT';
  String _nom;
  String _prenom;
  String _number;
  bool _loading = false;

   
   List<String> citys = [ 'NKTT','NDB'];
  List<String> bloodtypes = [ 'O','A+','AB+','A-'];
  @override
  Widget build(BuildContext context) {
   if(!_loading) {return Scaffold(
      appBar:AppBar(
        backgroundColor:Colors.deepPurple[400] ,
        title: Text('Information'),
      ),
      body: Form(
                key : _fromkey,
              child: ListView(
          padding: EdgeInsets.all(10),
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                 validator: (val){
                     if(val.length ==0){
                       return 'vous n aver pas donnez un nom';
                     }else if(val.length > 15)
                     return 'le nom est tres long';
                     else return null;
                   },
                
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
                   validator: (val){
                     if(val.length ==0){
                       return 'vous n aver pas donnez un prenom';
                     }else if(val.length > 15)
                     return 'le prenom est tres long';
                     else return null;
                   },
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
                validator: (val){
                  if(val.length < 8 || val.length > 15 || val.isEmpty){
                    return 'le numero est invalide';
                  }else return null;
                },
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
                  value:_bloodtype
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
                  value:_city
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
                     if (_fromkey.currentState.validate()){
                 String uid = await DatabaseService().singnInAnon();
                 if(uid != null){
                 DatabaseService _database = DatabaseService(uid: uid);
                 setState(() => _loading = true);
                  Userdata userdata = Userdata(
                    nom:_nom ,
                   prenom: _prenom,
                    number: _number,
                    city:_city,
                    bloodtype:_bloodtype );
                  await _database.updateInformation(userdata);
                  Navigator.pop(context);}
                  else{
                    print('Can not sign in');
                  }}
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
      ),
    );}else{
      return Loading();
    }
  }

 
}