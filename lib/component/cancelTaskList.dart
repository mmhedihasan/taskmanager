import 'package:flutter/material.dart';
import 'package:taskmanager/component/taskList.dart';

import '../api/apiClient.dart';

class cancelTaskList extends StatefulWidget {
  const cancelTaskList({super.key});

  @override
  State<cancelTaskList> createState() => _cancelTaskListState();
}

class _cancelTaskListState extends State<cancelTaskList> {
  List taskItems=[];
  bool Loading= true;

  @override
  void initState(){
    callData();
    super.initState();

  }

  callData() async {
    var data= await TaskListRequest("Canceled");
    setState(() {
      Loading=false;
      taskItems=data;
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
