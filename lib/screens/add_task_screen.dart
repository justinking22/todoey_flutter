import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.lightBlueAccent, fontSize: 30.0),
            ),
            TextField(
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightBlueAccent))),
              cursorColor: Colors.lightBlueAccent,
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                newTaskTitle = newText;
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      WidgetStatePropertyAll(Colors.lightBlueAccent),
                  shape: WidgetStatePropertyAll(ContinuousRectangleBorder(
                      borderRadius: BorderRadius.zero))),
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Provider.of<TaskData>(context, listen: false)
                    .addTask(newTaskTitle!);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
