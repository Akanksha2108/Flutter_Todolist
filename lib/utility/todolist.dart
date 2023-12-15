import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:velocity_x/velocity_x.dart';

class Todolist extends StatelessWidget {
  final String taskname;
  final bool taskcomplete;
  Function(bool?)? onchanged;
  Function(BuildContext)? deletetask;

  Todolist(
      {super.key,
      required this.onchanged,
      required this.taskcomplete,
      required this.deletetask,
      required this.taskname});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: deletetask,
            icon: Icons.delete,
            backgroundColor:Colors.red,
            borderRadius: BorderRadius.circular(12),
          )
        ]),
        child: Container(
            padding: EdgeInsets.all(25.0),
            decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12)),
            child: Row(children: [
              Checkbox(
                value: taskcomplete,
                onChanged: onchanged,
                activeColor: Colors.black,
              ),
              Text(
                taskname,
                style: TextStyle(
                  color: Colors.white,
                  decoration: taskcomplete
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              )
            ])),
      ),
    );
  }
}
