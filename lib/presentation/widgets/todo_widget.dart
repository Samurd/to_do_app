import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/domain/entities/todo.dart';
import 'package:to_do_app/presentation/providers/todo_List_provider.dart';

class TodoWidget extends StatefulWidget {
  final Todo todo;
  const TodoWidget({super.key, required this.todo});

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  void onChangeBox() {
    setState(() {
      widget.todo.isDone = !widget.todo.isDone;
    });
  }

  @override
  Widget build(BuildContext context) {
    final todoListProvider = context.watch<TodoListProvider>();
    final colors = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        tileColor: widget.todo.isDone ? Colors.grey[600] : Colors.grey[800],
        minVerticalPadding: 20,
        trailing: IconButton(
            onPressed: () {
              todoListProvider.deleteTodo(widget.todo);
            },
            icon: const Icon(Icons.delete),
            color: Colors.red),
        leading: Checkbox(
            value: widget.todo.isDone, onChanged: (value) => onChangeBox()),
        onTap: () => onChangeBox(),
        title: Text(
          widget.todo.title,
          style: TextStyle(
              decoration:
                  widget.todo.isDone ? TextDecoration.lineThrough : null,
              letterSpacing: 0,
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
        subtitle: widget.todo.description != null
            ? Text(
                widget.todo.description!,
                style: TextStyle(color: colors.primary),
              )
            : null,
      ),
    );
  }
}
