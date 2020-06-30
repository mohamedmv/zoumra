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
     backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Info'),
        backgroundColor:Colors.deepPurple[400] ,
      ),
      body: Center(
        child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                
                Text('Nom : ${user['nom']} ${user['prenom']}',
                style: TextStyle(fontSize:20, color: Colors.black,fontWeight: FontWeight.w600 ),
                ),

                Text('Numero : ${user['numero']}',
                style: TextStyle(fontSize:20, color: Colors.black , fontWeight: FontWeight.w600),
                ),

                Text('Group Sangin : ${user['bloodtype']}',
                style: TextStyle(fontSize:20, color: Colors.black,fontWeight: FontWeight.w600 ),
                ),
                

              ]
            ),
      ),
        
      
    );
  }
}