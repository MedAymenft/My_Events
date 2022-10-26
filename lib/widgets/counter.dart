// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


class Counter extends StatelessWidget {

  final int taskDo;
  final int tot;

  const Counter({Key? key, required this.taskDo,required this.tot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top:15),
                    child: Text("${taskDo}/${tot}",style:TextStyle(color:(taskDo==tot)?Colors.green:Colors.white,fontSize: 27,fontWeight: FontWeight.bold))
                    );
  }
}