


// ignore_for_file: prefer_const_literals_to_create_immutables, sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TaskCard extends StatelessWidget {
  
  final String title;
  final bool status;
  Function changeStat ; 
  int pos;
  Function delete;

  TaskCard({required this.title,required this.status,required this.changeStat, required this.pos,required this.delete});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        changeStat(pos);
      },
      child: FractionallySizedBox(
                        widthFactor: 0.9,
                        child: Container(
                        
                          child: Row(children: [
                            Text(title,style:TextStyle(fontSize: 22,
                                                      decoration:(status)? TextDecoration.lineThrough:TextDecoration.none ,
                                                      color:(status)?Colors.black:Colors.white)
                            ),
                          Row(
                            children: [
                              (status)?Icon(Icons.check,color:Colors.green,size:28) : Icon(Icons.close,color:Colors.red,size:28),
                              IconButton(icon: Icon(Icons.delete,color:Colors.red[100],),
                                          onPressed: () {
                                            delete(pos);
                                          },
                              )
                            ],
                          ),
                          
                      
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                          margin:EdgeInsets.only(top:20),
                          padding: EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color:Color.fromRGBO(209, 224, 224, 0.2),
                            borderRadius: BorderRadius.circular(11)
                          ),
                        ),
                      ),
    );
  }
}