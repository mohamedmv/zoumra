import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  var val = 'A+';
  List<String> bloodtypes = [ 'O','A+','AB+','A-'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor:Colors.deepPurple[400] ,
        title: Text('Information'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              
              decoration: InputDecoration(
                hintText: 'entrez votre nom',
                labelText: 'Nom',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
              ),
           
            ),
          ),

         
              Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              
              decoration: InputDecoration(
                hintText: 'entrez votre prenom',
                labelText: 'Prenom',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
              ),)),
              
              Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              
              decoration: InputDecoration(
                hintText: 'entrez votre numero',
                labelText: 'Numero',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
              ),)),
           
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text('Type de san :',style: TextStyle(fontSize: 17),),
              Container(
                margin: EdgeInsets.only(left: 20,right: 20),
                
                child: DropdownButton(
                 
                  items: bloodtypes.map((String type){
                    return DropdownMenuItem(
                      child: Text(type),
                      value:type,
                      );
                  }).toList()
                  ,
                value:val
                 ,onChanged: (s){
                   setState(() {
                     val= s;
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
               Expanded(child: FlatButton(onPressed: (){}, 
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
    );
  }
}