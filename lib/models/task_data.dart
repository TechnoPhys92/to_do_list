import 'package:flutter/foundation.dart';
import 'package:to_do_list/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier{

  final List<Task> _tasks = [];

  int get taskCount{
    return _tasks.length;
  }

  void addTask(String newTaskTitle){
    final task = Task(name: newTaskTitle, isDone: false);
    _tasks.add(task);
    notifyListeners();
  }

  List<Task> get tasks{
    return UnmodifiableListView(_tasks);
  }

  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }
}