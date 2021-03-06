import 'package:flutter/material.dart';
import 'package:zoumra/shared/AppLocalization.dart';


class NonConnectedDrawer extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
               
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
                             child: CircleAvatar(
                               radius: 50.0,
                               backgroundColor: Colors.blue,
                               child: Icon(Icons.person , size: 50,),
                             )
                             
                            

                           ),
                         
                       
                       
                     
                    
                     
                      
                    ],
                  ),
                
                ),
                
                // settings list tile
                 Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border:Border(bottom: BorderSide(color: Colors.grey[400]))
                  ),
                  child: ListTile(
                    onTap: (){ Navigator.pushNamed(context, '/settings');  },

                    leading: Icon(Icons.settings),
                    title: Text(AppLocalization.of(context).trenslate('settings'))
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
                    title: Text(AppLocalization.of(context).trenslate('help'))
                  ),
                ),
                 
               
                
            ],
          ),
    );
  }
}