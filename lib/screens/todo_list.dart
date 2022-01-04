import 'package:flutter/material.dart';
import 'package:todo_app/db/functions/db_function.dart';
import 'package:todo_app/db/models/db_model.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ValueListenableBuilder(
      valueListenable: todoListNotifier,
      builder: (BuildContext ctx, List<TodoModel> todoList, Widget? child) {
        return ListView.separated(
          padding: const EdgeInsets.all(10),
          itemBuilder: (ctx, index) {
            final data = todoList[index];
            return ListTile(
              leading: const CircleAvatar(
                child: const Icon(Icons.calendar_today),
              ),
              title:   Text(data.name),
              subtitle:   Text(data.detail),
              trailing: IconButton(
                onPressed: () {
                  if (data.id != null) {
                    deleteTodo(data.id!);
                  }
                },
                icon: const Icon(Icons.delete),
              ),
            );
          },
          separatorBuilder: (ctx, index) {
            return const Divider(
              color: Colors.grey,
              thickness: 1,
            );
          },
          itemCount: todoList.length
        );
      },
    ));
  }
}
