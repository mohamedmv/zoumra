import 'package:flutter/material.dart';
import 'package:zoumra/shared/AppLocalization.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    Map user = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      
    //  backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: Text(AppLocalization.of(context).trenslate('info')),
        backgroundColor:Colors.deepPurple[400] ,
      ),
    
      body:Center(
        
          child: Container(
            padding: EdgeInsets.all(20),
            child: Material(
              
              
             elevation: 7.0,
             borderRadius: BorderRadius.circular(10.0),
              child: Container(
                margin: EdgeInsets.all(20),
                 height: 190,
                
                
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                      
                      children: <Widget>[
                        
                        
                   Center(
                     child:  Hero(
                   tag: '${user['numero']}',
                       child: Text('${user['bloodtype']}',
                          style: TextStyle(fontSize:70,fontWeight: FontWeight.w600,color:Colors.orangeAccent[700]),
                          ),),
                   ),

                        Wrap(
                          direction: Axis.horizontal,
                          children: <Widget>[
                            Text('${AppLocalization.of(context).trenslate('name')} : ${user['nom']}',
                            style: TextStyle(fontSize:20,fontWeight: FontWeight.w500 ),
                            ),
                             Text(' ${user['prenom']}',
                            style: TextStyle(fontSize:20,fontWeight: FontWeight.w500 ),
                            ),
                          ],
                        ),

                        Text('${AppLocalization.of(context).trenslate('number')} : ${user['numero']}',
                        style: TextStyle(fontSize:20, fontWeight: FontWeight.w400),
                        ),

                       
                         Text('${AppLocalization.of(context).trenslate('city')}: ${user['city']}',
                        style: TextStyle(fontSize:20,fontWeight: FontWeight.w400 ),
                        ),
                        

                      ]
                    ),
              ),
            ),
          ),
        ),
      
        
      
    );
  }
}