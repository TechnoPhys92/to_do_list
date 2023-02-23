import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/models/task_data.dart';
import 'package:to_do_list/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child){
        return ListView.builder(itemBuilder: (context, index){
          final task = taskData.tasks[index];
          return TaskTile(
            taskTitle: taskData.tasks[index].name,
            isChecked: taskData.tasks[index].isDone!,
            checkBoxCallback: (bool? value) {
              taskData.updateTask(task);
            },
            longPressCallback: () {
              taskData.deleteTask(task);
            },
          );
        },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}