import 'package:flutter/material.dart';
import 'package:taskmanager/component/taskList.dart';

import '../api/apiClient.dart';

class progressTaskList extends StatefulWidget {
  const progressTaskList({super.key});

  @override
  State<progressTaskList> createState() => _progressTaskListState();
}

class _progressTaskListState extends State<progressTaskList> {
  List taskItems=[];
  bool Loading= true;

  @override
  void initState(){
    callData();
    super.initState();

  }

  callData() async {
    var data= await TaskListRequest("progress");
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
