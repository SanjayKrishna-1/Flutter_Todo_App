import 'package:flutter/material.dart';
import 'package:todo_app/db/functions/db_function.dart';
import 'package:todo_app/db/models/db_model.dart';

class SlidingPanel extends StatelessWidget {
  SlidingPanel({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  final ScrollController scrollController;
  final _nameController = TextEditingController();
  final _detailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
      ),
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              filled: true,
              hintText: 'Enter Todo Name',
              labelText: 'Todo Name',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _detailController,
            decoration: const InputDecoration(
              border: const OutlineInputBorder(),
              filled: true,
              hintText: 'Enter Details',
              labelText: 'Details',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FloatingActionButton(
            onPressed: () {
              onAddTodoButtonClicked();
            },
            child: Icon(Icons.add),
            backgroundColor: Colors.amber[800],
          )
        ],
      ),
    );
  }

  Future<void> onAddTodoButtonClicked() async {
    final _name = _nameController.text.trim();
    final _details = _detailController.text.trim();
    if (_name.isEmpty || _details.isEmpty) {
      return ;
    } else {
      final _todo = TodoModel(name: _name, detail: _details);
      addTodo(_todo);
      _nameController.clear();
      _detailController.clear();
    }
  }
}

