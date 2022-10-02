import 'package:hive_flutter/adapters.dart';
import 'package:hive/hive.dart';

class TodoDatabse{
  List toDoList = [];
  final _myBox = Hive.box('mybox');
  void createInitialData(){
    toDoList = [
      ["Task 1", false],
      ["Task 2", false]
    ];
  }
  void loadData(){
    toDoList = _myBox.get("TODOLIST");

  }
  void updateHive(){
      _myBox.put("TODOLIST", toDoList);
  }
}