import 'package:flutter/material.dart';
import 'package:taskmanager/api/apiClient.dart';
import 'package:taskmanager/component/taskList.dart';

class newTaskList extends StatefulWidget {
  const newTaskList({super.key});

  @override
  State<newTaskList> createState() => _newTaskListState();
}

class _newTaskListState extends State<newTaskList> {
  List taskItems=[];
  bool Loading= true;

  @override
  void initState(){
    callData();
    super.initState();

  }

  callData() async {
    var data= await TaskListRequest("New");
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
