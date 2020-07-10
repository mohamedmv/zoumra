import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'package:zoumra/shared/theme.dart';


class NonconnectedSettings extends StatefulWidget {
  @override
  _NonconnectedSettingsState createState() => _NonconnectedSettingsState();
}

class _NonconnectedSettingsState extends State<NonconnectedSettings> {
 

  @override
  Widget build(BuildContext context) {
    
    
   
    final mytheme = Provider.of<Mytheme>(context);
    // g is for the value of the curent theme
     int g;
     if ( mytheme.theTheme != null)
      g = mytheme.theTheme ? 0 : 1;
      else g = 0;
      

     return Scaffold(
          appBar:AppBar(
            backgroundColor:Colors.deepPurple[400] ,
            title: Text('Settings'),
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
                        child: Text('Theme', style: TextStyle( fontSize: 23,fontWeight: FontWeight.w600),),
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
                                     Text('Light theme',style: TextStyle( fontSize: 15, fontWeight:FontWeight.w600),),

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
                                     Text('Dark theme',style: TextStyle( fontSize: 15, fontWeight:FontWeight.w600),),

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


             
              
                ],
              ),);
            

              
             
  
  }

 
}