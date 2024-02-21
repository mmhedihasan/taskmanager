import 'package:flutter/material.dart';
import 'package:taskmanager/component/taskList.dart';

import '../api/apiClient.dart';

class completedTaskList extends StatefulWidget {
  const completedTaskList({super.key});

  @override
  State<completedTaskList> createState() => _completedTaskListState();
}

class _completedTaskListState extends State<completedTaskList> {
  List taskItems = [];
  bool Loading = true;

  @override
  void initState() {
    callData();
    super.initState();
  }

  callData() async {
    var data = await TaskListRequest("Completed");
    setState(() {
      Loading = false;
      taskItems = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Loading
        ? (Center(
            child: LinearProgressIndicator(),
          ))
        : RefreshIndicator(
            onRefresh: () async {
              await callData();
            },
            child: Center(
              child: TaskList(taskItems),
            ),
          );
  }
}
