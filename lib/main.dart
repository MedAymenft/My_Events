
// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:my_events/widgets/tasc-card.dart';
import 'package:my_events/widgets/counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyEvents(),
      debugShowCheckedModeBanner: false,
    );
  }
}





class MyEvents extends StatefulWidget {
  const MyEvents({Key? key}) : super(key: key);

  @override
  State<MyEvents> createState() => _MyEventsState();
}

class Task{
  final String title;
  var  status;


  Task({required this.title , required this.status,});
}

  
class _MyEventsState extends State<MyEvents> {
final allTasks = [
    Task(title:"Take care of my daughter",status:true),
    Task(title:"Call my mom",status:false),
    Task(title:"go to work",status:true),
        Task(title:"do the Homework",status:false),

  ];

//remove the current tasc-card when clicking on "delete icon" 
  delete(int pos){
    setState(() {
      allTasks.remove(allTasks[pos]);
    });
  }
//delete all tasks when clicking on "delete icon" in the Appbar

  deleteAll(){
    setState(() {
      allTasks.removeRange(0, allTasks.length);
    });
  }
  // change the status of tasc-card (completed or not) when click on the tasc-card
changeStatus(int position){
    setState(() {
      allTasks[position].status = !allTasks[position].status;
    });
  }

//add new task when clicking on the floating actionButton
  myfunc(){

      setState(() {
                allTasks.add(Task(title: myController.text,status: false));

      });
      
  }

//create controller to get the text inside the textField in the showModalBottomSheet
  final myController = TextEditingController();

  int total =0;

// clalculate the tasks completed
  int taskTerminate(){
    int ok = 0;
    for (var element in allTasks)
    { if(element.status) {
      ok++ ;
    }}
    return ok;
  } 
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:FloatingActionButton(onPressed: () { showModalBottomSheet(context: context, 
                                      builder: (BuildContext context) {
                                        return Container(height:double.infinity,
                                                        color:Colors.deepOrange[100], 
                                                        child:  Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          FractionallySizedBox(
                                            widthFactor: 0.8,
                                            child: TextField(controller:myController,maxLength: 20, decoration: InputDecoration(hintText: "Write your task for today",
                                                                                    hintStyle:TextStyle(fontSize:20,fontWeight: FontWeight.bold))),
                                          ),
                                          SizedBox(height: 20),
                                          TextButton(onPressed: (){myfunc();  Navigator.pop(context);}, child: Text("Add Task",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 24))),
                                        ],
                                      )
                                      );
                                        
                                      }, 
                                      isScrollControlled: true
                                      );    },child:Icon(Icons.add)) ,
      backgroundColor: Color.fromRGBO(58, 66, 86, 0.7),
      appBar: AppBar(
        actions:[IconButton(onPressed: (){
                                deleteAll();
                                                  },
                            icon: Icon(Icons.delete_forever,size:37,color:Colors.red[100])),
                                                                                ],
        title: Text(
          'For Today',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromRGBO(58, 66, 86, 0.7),
        centerTitle: true,
        elevation: 0,
      ),

      body: SizedBox(
        width: double.infinity,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,  
            children:[
                    Counter(taskDo :taskTerminate(),tot: allTasks.length),
                    Container(
                      margin:EdgeInsets.only(top:20),
                      height:500,
                      color:Color.fromARGB(255, 55, 63, 82),
                      child: ListView.builder(
                        itemCount:allTasks.length ,
                        itemBuilder: (context, index){
                                return TaskCard(title:allTasks[index].title,
                                                status:allTasks[index].status,
                                                changeStat:changeStatus,
                                                pos:index,
                                                delete:delete);
                        },
                      ),
                    )



                    //...allTasks.map((e) => TaskCard(title:e.title,status:e.status)).toList()
                    


          ],
        ),
      )
    );
  }
}
