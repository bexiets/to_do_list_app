import 'package:flutter/material.dart';

class TasksTile extends StatelessWidget {
  
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  final void Function() longPressCallback;

  const TasksTile({required this.taskTitle, required this.isChecked, required this.checkboxCallback,required this.longPressCallback});

  @override

  Widget build(BuildContext context) {
    return  ListTile(
      title: Text(taskTitle, style: TextStyle(decoration: isChecked ? TextDecoration.lineThrough : null)),
      trailing:  Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: isChecked, 
      onChanged: (newValue){
        checkboxCallback(newValue);
      }
      ),
      onLongPress: longPressCallback,
    );
  }
}



