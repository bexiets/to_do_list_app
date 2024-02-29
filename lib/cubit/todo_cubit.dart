import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_app/models/task.dart';


class TodoCubit extends Cubit<List<Task>> {
  TodoCubit() : super([]);

  void addTaskCubit (String newTask){
    final todo = Task(name: newTask, isDone: false);

    
    emit([...state, todo]);
  }
  
 

  void deleteTask (Task taskToRemove){
    final List<Task> updatedTasks = List<Task>.from(state);

    updatedTasks.remove(taskToRemove);    
    emit(updatedTasks);
  }

  void updateTask(Task updatedTask){
   final List<Task> updatedTasks = List<Task>.from(state);
   final int index = updatedTasks.indexWhere((task) => task.name == updatedTask.name);
   if (index != -1) {
    updatedTasks[index].toggleDone();
    emit(updatedTasks);
  }
   
    
  }


  int get taskCount{
    return state.length;
  }
}
