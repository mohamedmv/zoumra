 
 import 'package:flutter/material.dart';

class MyCityRadioBox extends StatefulWidget {
     
    final Function changegoo;
     final int ini;
  final List<String> list;
  MyCityRadioBox({this.list,this.ini,this.changegoo});
   @override
   _MyCityRadioBoxState createState() => _MyCityRadioBoxState();
 }
 
 class _MyCityRadioBoxState extends State<MyCityRadioBox> {
   
   int g;
   @override
   Widget build(BuildContext context) {
     
     return Container(
        child:  Wrap(
          children: [
          
                Container(   
              width: 120,
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
              width: 120,
              child:Card(
                   child: ListTile(
                     onTap: () => setState((){ g =1;  widget.changegoo(g);}) ,
                     leading: Text('${widget.list[1]}',style: TextStyle( fontSize: 15, fontWeight:FontWeight.w600),),
                     trailing: Radio( value: 1, groupValue: g ?? widget.ini, activeColor: Colors.purple,
                           onChanged:(val){setState(()=> g=val); widget.changegoo(g);}),
                   
                   ),
                     
                  
                ),
              
              ),

          
          ],
        ),
     );
   }

  
 }