import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoumra/Models/userdata.dart';
import 'package:zoumra/screens/settings/dialogs.dart';
import 'package:zoumra/services/database.dart';
import 'package:zoumra/shared/AppLocalization.dart';
import 'package:zoumra/shared/Loading.dart';
import 'package:zoumra/shared/theme.dart';

import 'nonconnectedSettings.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
    
    
 
  Userdata userdata ;
  void fun(a,b){ setState(() => b = a);}
  String uid;
  bool _loading = false;

   
   List<String> citys = [ 'NKTT','NDB'];
  List<String> bloodtypes = [ 'O','A+','AB+','A-'];
  @override
  Widget build(BuildContext context) {
    final mytheme = Provider.of<Mytheme>(context);
      int g;
     if ( mytheme.theTheme != null)
      g = mytheme.theTheme ? 0 : 1;
      else g = 0;
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
            title: Text(AppLocalization.of(context).trenslate('settings')),
          ),
          body: ListView(
            padding: EdgeInsets.all(10),
            children: <Widget>[
   

                // Dark and light theme buttons
                 Container(
               
                child: Card(
                 
                  borderOnForeground: true,
                  elevation: 3.0,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(AppLocalization.of(context).trenslate('theme') , 
                        style: TextStyle( fontSize: 23,fontWeight: FontWeight.w600),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:Flex(
                        
                          direction: Axis.horizontal,
                          children: <Widget>[
                            
              Expanded(  flex: 1,
                              child: Container(   
                                             padding: EdgeInsets.all(5),
                            child:Card(
                              elevation: 6.0,
                               child: ListTile(
                                 onTap: () => setState(() { mytheme.changetolight();}) ,
                                 title:  Row(
                                   children: <Widget>[
                                     Text(AppLocalization.of(context).trenslate('light theme') ,
                                     style: TextStyle( fontSize: 15, fontWeight:FontWeight.w600),),

                                     Radio( value: 0, groupValue:  g, activeColor: Colors.purple,
                                       onChanged:(val){ mytheme.changetolight();}),
                                   ],


                                 ),
                                
                               )   
                            ),
                          ),
              ),
                         
                          Expanded( flex:1,
                              child: Container(  
                              
                        padding: EdgeInsets.all(5),
                            child:Card(
                               elevation: 6.0, 
                               child: ListTile(
                                 onTap: () => setState(() {mytheme.changetodark();}) ,
                                  title:  Row(
                                   children: <Widget>[
                                     Text(AppLocalization.of(context).trenslate('dark theme') ,
                                     style: TextStyle( fontSize: 15, fontWeight:FontWeight.w600),),

                                     Radio( value: 1, groupValue:  g, activeColor: Colors.purple,
                                       onChanged:(val){  mytheme.changetodark();}),
                                   ],


                                 ),
                               
                               ), 
                            ),
                        ),
                          ),
                         

             
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),


         //setting for active 
                Card(
                elevation: 7.0,
                        child: ListTile(
                 title: Text(AppLocalization.of(context).trenslate('visible')
                 , style: TextStyle(fontSize: 20),),
                 trailing: Switch(
                   activeColor: Colors.red,
                   value: userdata.actife,
                   onChanged: (val) async{
                     Userdata _userdata = Userdata(
                     nom: userdata.nom,
                     prenom: userdata.prenom,
                     city: userdata.city,
                     bloodtype: userdata.bloodtype,
                     number:  userdata.number,
                    actife: val,
                   );
                    await _database.updateInformation(_userdata);
                   }
                   ),
                ),
              ),

              //setting for nom
              Card(
                elevation: 6.0,
                              child: ListTile(
                 title: Text('${AppLocalization.of(context).trenslate('name')}: ${userdata.nom}',
                  style: TextStyle(fontSize: 20),),
                 trailing: FlatButton(
                   color: Colors.red,
                   onPressed: (){
                    
                     Dialogs().nomDialog(context ,userdata,_database);
                   },
                    child: Text(AppLocalization.of(context).trenslate('modify'),
                     style: TextStyle(color:Colors.white),)),
                ),
              ),

              //setting for prenom
                Card(
                elevation: 6.0,
                              child: ListTile(
                 title: Text('${AppLocalization.of(context).trenslate('firstname')}: ${userdata.prenom}', style: TextStyle(fontSize: 20),),
                 trailing: FlatButton(
                   color: Colors.red,
                   onPressed: (){
                      Dialogs().prenomDialog(context ,userdata,_database);
                   },
                    child: Text(AppLocalization.of(context).trenslate('modify')
                    , style: TextStyle(color:Colors.white),)),
                ),
              ),

              //setting for bloodtype
                Card(
                elevation: 7.0,
                              child: ListTile(
                 title: Text('${AppLocalization.of(context).trenslate('bloodtype')}: ${userdata.bloodtype}', style: TextStyle(fontSize: 20),),
                 trailing: FlatButton(
                   color: Colors.red,
                   onPressed: (){
                     setState(() {  Dialogs().bloodtypeDialog(context ,bloodtypes,userdata,_database); });
                    
                   },
                    child: Text(AppLocalization.of(context).trenslate('modify')
                    , style: TextStyle(color:Colors.white),)),
                ),
              ),

              //setting for city
                Card(
                elevation: 7.0,
                              child: ListTile(
                 title: Text('${AppLocalization.of(context).trenslate('city')}: ${userdata.city}', style: TextStyle(fontSize: 20),),
                 trailing: FlatButton(
                   color: Colors.red,
                   onPressed: (){
                     setState(() {  Dialogs().cityDialog(context ,citys,userdata,_database); });
                   },
                    child: Text(AppLocalization.of(context).trenslate('modify')
                    , style: TextStyle(color:Colors.white),)),
                ),
              ),

              //setting for number
                Card(
                elevation: 7.0,
                              child: ListTile(
                 title: Text('${AppLocalization.of(context).trenslate('number')}: ${userdata.number}', style: TextStyle(fontSize: 20),),
                 trailing: FlatButton(
                   color: Colors.red,
                   onPressed: (){
                     Dialogs().numberDialog(context ,userdata,_database);
                   },
                    child: Text(AppLocalization.of(context).trenslate('modify')
                    , style: TextStyle(color:Colors.white),)),
                ),
              ),
  
            
             
             
             
              
                ],
              ),
            

              
             
         
    );}else return Loading();
       }
     );}else return NonconnectedSettings();
       }); 
     }else return Loading();
    
  }

 
}