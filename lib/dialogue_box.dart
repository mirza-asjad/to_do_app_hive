
import 'package:flutter/material.dart';
import 'package:to_do_app_hive/my_buttons.dart';



class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback savebutton;
  
  const DialogBox({super.key, required this.controller, required this.savebutton});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

          TextField(
            controller: controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Add Text',
            ),
          ),


          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MyButtons(buttonName: 'Save', onPressed: savebutton),

              const SizedBox(width: 8,),


              MyButtons(buttonName: 'Cancel', onPressed: (){
                Navigator.of(context).pop();
              })
            ],
          )






        ]),
      ),

    );
  }
}