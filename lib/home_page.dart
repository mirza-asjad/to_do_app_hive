import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app_hive/database.dart';
import 'package:to_do_app_hive/dialogue_box.dart';
import 'package:to_do_app_hive/to_do_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _myBox = Hive.box('mybox');

  final _controller = TextEditingController();

  ToDoDataBase db = ToDoDataBase();


  @override
  void initState() {
    
    if(_myBox.get('TODOLIST')==null)
    {
      db.createInitialData();
    }
    else
    {
      db.loadData();
    }




    super.initState();
  }
  


  void checkboxChanged(bool? value, int index) {
    setState(() {
      db.toDolist[index][1] = !db.toDolist[index][1];
    });
    db.updateDatabase();
  }


  savenewTask()
  {
    setState(() {
      db.toDolist.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  void createnewTask() {
  showDialog(
    context: context,
    builder: (context) {
      return DialogBox(controller: _controller, savebutton: savenewTask,     
        
      ); // Replace DialogBox() with your custom dialog widget.
    },
  );
}

void deleteTaskfunction(int index)
{
  setState(() {
    db.toDolist.removeAt(index);
  });
  db.updateDatabase();
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text('To Do'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createnewTask,
        child: const Icon(Icons.add),
        
      ),
      body: ListView.builder(
        itemCount: db.toDolist.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDolist[index][0],
            taskCompleted: db.toDolist[index][1],
            onChanged: (value) => checkboxChanged(value, index),
            deleteTask: (context)=> deleteTaskfunction(index),
          );
        },
      ),
    );
  }
}
