import 'package:hive/hive.dart';

class ToDoDataBase
{

  List toDolist = [];

  final _myBox= Hive.box('mybox');


  void createInitialData()
  {
    toDolist = [
      ["Make First",false]
      ,["Make Second",false]
    ];

  }


  void loadData()
  {
    toDolist = _myBox.get('TODOLIST');
  }

  void updateDatabase()
  {
    _myBox.put("TODOLIST", toDolist);

  }

}



