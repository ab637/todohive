import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todohive/data/database.dart';
import 'package:todohive/utility/dialog_box.dart';
import 'package:todohive/utility/todo_tile.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_flutter/adapters.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('mybox');
  // text controller goes here
  final _controller = TextEditingController();

  // list of to do task
 TodoDatabse db = TodoDatabse();

 @override
  void initState() {
    // TODO: implement initState
    if( _myBox.get("TODOLIST")==null
    ){
     db.createInitialData();
   }
   else{
     db.loadData();
   }
   }
  // method to check;
  void checkBoxChanged( bool? value, int index){
    setState(() {
       db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateHive();
  }
  void creatNewTask(){
    showDialog(context: context, builder: (context)
    {
      return dialogBox(controller:_controller ,
      onSave: saveNewTask,
        onCancel: ()=> Navigator.of(context).pop(),
      );
    });

  }
  void saveNewTask(){
    setState(() {
      db.toDoList.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateHive();

  }
  // delete task
  void deleteTask( int index, )
  {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateHive();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        title: Text("TO-DO-LIST", style: TextStyle(color: Colors.black),),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: creatNewTask,
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.blue,
                  Colors.red,
                ],
              )
          ),
          child: ListView.builder(itemCount: db.toDoList.length,
          itemBuilder: (context, index) => TodoTile(taskName: db.toDoList[index][0], taskCompleted: db.toDoList[index][1], onChanged: (value) => checkBoxChanged(value, index),
          deleteFunction: (context) => deleteTask(index),

          ),
          ),
        ),
      )

    );
  }
}
