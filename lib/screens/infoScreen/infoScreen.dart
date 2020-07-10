import 'package:flutter/material.dart';

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
        title: Text('Info'),
        backgroundColor:Colors.deepPurple[400] ,
      ),
    
      body: Center(
      
        child: Container(
          padding: EdgeInsets.all(20),
          child: Material(
            
            
           elevation: 7.0,
           borderRadius: BorderRadius.circular(10.0),
            child: Container(
              margin: EdgeInsets.all(20),
               height: 120,
              
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                    
                    children: <Widget>[
                      
                      Wrap(
                        direction: Axis.horizontal,
                        children: <Widget>[
                          Text('Nom : ${user['nom']}',
                          style: TextStyle(fontSize:20,fontWeight: FontWeight.w500 ),
                          ),
                           Text(' ${user['prenom']}',
                          style: TextStyle(fontSize:20,fontWeight: FontWeight.w500 ),
                          ),
                        ],
                      ),

                      Text('Numero : ${user['numero']}',
                      style: TextStyle(fontSize:20, fontWeight: FontWeight.w400),
                      ),

                      Text('Group Sangin : ${user['bloodtype']}',
                      style: TextStyle(fontSize:20,fontWeight: FontWeight.w400 ),
                      ),
                       Text('Ville: ${user['city']}',
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