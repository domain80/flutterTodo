import 'package:flutter/material.dart';
import 'package:todo/components/AddDialog.dart';
import 'package:todo/components/TodoItem.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List todoList = [
    ["finish todo app today", false],
    ["Prepare for the future", false],
    ["another banger", false],
    ["feel great about the future", false],
  ];

  void openAddDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return Adddialog(
            onAdd: (String newItem) {
              setState(() {
                todoList.add([newItem, false]);
              });
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
        backgroundColor: Colors.deepPurple[200],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          openAddDialog();
        },
        label: Text("Add"),
        icon: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 18, left: 18, right: 18),
              child: Todoitem(
                title: todoList[index][0],
                isDone: todoList[index][1],
                onChanged: (val) {
                  setState(() {
                    todoList[index][1] = val;
                  });
                },
                onDismissed: () {
                  setState(() {
                    todoList.removeAt(index);
                  });
                },
              ),
            );
          }),
    );
  }
}
