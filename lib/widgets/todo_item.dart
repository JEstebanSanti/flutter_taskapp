// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_task/constants/colors.dart';
import 'package:flutter_task/models/to_do.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({
    Key? key,
    required this.todo,
    required this.status,
  }) : super(key: key);
  final ToDo todo;
  final bool status;
  @override
  State<TodoItem> createState() => _TodoItemState(isChecked: status);
}

class _TodoItemState extends State<TodoItem> {
  bool isChecked = false;
  _TodoItemState({required this.isChecked});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          onTap: () => {
            print('Tapping'),
            print("checked ${isChecked}")
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25)
          ),
          leading: Checkbox(
            value: isChecked,
            onChanged: (bool? value){
              setState(() {
                isChecked = value!;
              });
              print("vale: + ${value} +++ ${isChecked}");
            },
            ),
          title: Text(
            widget.todo.desciption.toString(),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400
            ),
          ),
          trailing: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(15)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            InkWell(
              onTap: () => {
                print("borrado")
              },
              child: Icon(Icons.delete_forever),
            ),
          ]),  
          ),
        ),
    );
  }
}
