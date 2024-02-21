import 'package:flutter/material.dart';
import 'package:taskmanager/style/style.dart';

ListView TaskList(taskItems){
  return ListView.builder(
      itemCount: taskItems.length,
      itemBuilder:(context, index){
        return Card(
          child: ItemSizeBox(
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(taskItems[index] ['title'], style: Head6Text(Colors.black54),),
                Text(taskItems[index] ['description'], style: Head6Text(Colors.black54),),
              ],
            )
          ),
        );
      }
  );
}