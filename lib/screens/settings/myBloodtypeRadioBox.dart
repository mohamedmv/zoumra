 
 import 'package:flutter/material.dart';

class MyRadioBox extends StatefulWidget {
     
    final Function changegoo;
     final int ini;
  final List<String> list;
  MyRadioBox({this.list,this.ini,this.changegoo});
   @override
   _MyRadioBoxState createState() => _MyRadioBoxState();
 }
 
 class _MyRadioBoxState extends State<MyRadioBox> {
   
   int g;
   @override
   Widget build(BuildContext context) {
     
     return Container(
        child:  Wrap(
          children: [
          
                Container(   
              width: 100,
              child:Card(
                   child: ListTile(
                     onTap: () => setState(() {g =0; widget.changegoo(g);}) ,
                     leading: Text('${widget.list[0]}',style: TextStyle( fontSize: 15, fontWeight:FontWeight.w600),),
                     trailing: Radio( value: 0, groupValue:  g ?? widget.ini, activeColor: Colors.purple,
                           onChanged:(val){setState(()=> g =val); widget.changegoo(g);}),
                   
                   ),
                     
                  
                ),
              
              ),
                 Container(   
              width: 100,
              child:Card(
                   child: ListTile(
                     onTap: () => setState((){ g =1;  widget.changegoo(g);}) ,
                     leading: Text('${widget.list[1]}',style: TextStyle( fontSize: 15, fontWeight:FontWeight.w600),),
                     trailing: Radio( value: 1, groupValue: g ?? widget.ini, activeColor: Colors.purple,
                           onChanged:(val){setState(()=> g=val); widget.changegoo(g);}),
                   
                   ),
                     
                  
                ),
              
              ),

                 Container(   
              width: 100,
              child:Card(
                   child: ListTile(
                     onTap: (){ setState(()=> g =2); widget.changegoo(g); },
                     leading: Text('${widget.list[2]}',style: TextStyle( fontSize: 15, fontWeight:FontWeight.w600),),
                      trailing: Radio( value: 2, groupValue: g ?? widget.ini, activeColor: Colors.purple,
                           onChanged:(val){setState(()=>  g =val); widget.changegoo(g);} ,
                   
                   ),
                     
                  
                ),
              )
              ),
               Container(   
              width: 100,
              child:Card(
                   child: ListTile(
                     onTap: () { setState(()=> g =3); widget.changegoo(g);} ,
                     leading: Text('${widget.list[3]}',style: TextStyle( fontSize: 15, fontWeight:FontWeight.w600),),
                     trailing: Radio( value: 3, groupValue: g ?? widget.ini, activeColor: Colors.purple,
                           onChanged:(val){setState(()=> g =val); widget.changegoo(g);} ),
                   
                   ),
                     
                  
                ),
              
              ),
          ],
        ),
     );
   }

  
 }