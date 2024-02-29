import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:to_do_list_app/cubit/todo_cubit.dart';
import 'package:to_do_list_app/models/task.dart';
import 'package:to_do_list_app/widgets/tasks_tile.dart';



class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
      return BlocBuilder<TodoCubit, List<Task>>(
        builder: (context, todos) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final todo = todos[index];
              // return ListTile(
              //   title: Text(todo.name),
              // );
              
              return TasksTile(
                taskTitle: todo.name,
                isChecked: todo.isDone,
                checkboxCallback: (checkboxState) {
                  BlocProvider.of<TodoCubit>(context).updateTask(
                  todo
                );
                },
                longPressCallback: () {
                  BlocProvider.of<TodoCubit>(context).deleteTask(
                  todo,
                );
                },
              );
            },
            itemCount: todos.length,
          );
        },
      );
   
  }
}
