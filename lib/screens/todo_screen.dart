import 'package:flutter/material.dart';
import '../models/todo_item.dart';
//just my imports

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}
//declares TodoListScreen as a stateful widget, manged by TodoListScreenState

class _TodoListScreenState extends State<TodoListScreen> {
  final List<TodoItem> _todoList = [];
  //array which holds all of the items in the TodoList as a list

  void _addTodoItem(String title) {
    setState(() {
      _todoList.add(TodoItem(title));
    });
  }
  //adjusts the state of the list to add an individual item to it

  void _removeTodoItem(int index) {
    setState(() {
      _todoList.removeAt(index);
    });
  }
  //adjusts the state of the list to remove an indidivual item from it

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.cyan[600],
      //scaffold is a widget which defines the basic structural layout of the app
      appBar: AppBar(
        title: Text('To-do List'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: _todoList.length,
            itemBuilder: (context, index) {
              return ListTile(
                contentPadding: EdgeInsets.zero, 
                leading: Row( 
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star_border_outlined),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () => _removeTodoItem(index),
                    ),
                  ],
                ),
                title: Text(_todoList[index].title),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Add Todo'),
                content: TextField(
                  autofocus: true,
                  onSubmitted: (value) {
                    _addTodoItem(value);
                    Navigator.pop(context); 
                  },
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}