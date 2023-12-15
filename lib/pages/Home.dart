import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/utility/dialog.dart';
import 'package:loginpage/utility/todolist.dart';
import 'package:velocity_x/velocity_x.dart';

class Homeroute extends StatefulWidget {
  Homeroute({super.key});
  @override
  State<Homeroute> createState() => _HomerouteState();
}

final _controller = TextEditingController();

class _HomerouteState extends State<Homeroute> {
  List todolist = [
    ["market", false],
    ["study", false],
    ["practice", false]
  ];

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onsaved: savenewtask,
          oncancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }
void deletefunction(int index)
{
  setState(() {
    todolist.removeAt(index);
  });
}
  void savenewtask() {
    setState(() {
      todolist.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void checkboxchanged(bool? value, int index) {
    setState(() {
      todolist[index][1] = !todolist[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white30,
        appBar: AppBar(
          centerTitle: true,
          title: "TO-DO LIST".text.make(),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => {createNewTask()}, child: Icon(Icons.add)),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Todolist(
              deletetask: (p0) => deletefunction(index),
                taskcomplete: todolist[index][1],
                taskname: todolist[index][0],
                onchanged: (value) => checkboxchanged(value, index));
          },
          itemCount: todolist.length,
        ));
  }
}
