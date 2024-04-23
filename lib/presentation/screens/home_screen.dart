import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/domain/entities/todo.dart';
import 'package:to_do_app/presentation/providers/todo_List_provider.dart';
import 'package:to_do_app/presentation/widgets/shared/addnew_todo_modal.dart';
import 'package:to_do_app/presentation/widgets/todo_widget.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final todoListProvider = context.watch<TodoListProvider>();
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title: Text(title),
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              color: Colors.grey[900],
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "To-Do List",
                      style: TextStyle(
                          color: colors.primary,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                        onPressed: () => showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            isScrollControlled: true,
                            context: context,
                            builder: (context) => const AddNewTodoModal()),
                        child: const Text("+Add Task"))
                  ]),
            ),

            // ------ Todo List
            Expanded(
              child: todoListProvider.todoList.isEmpty
                  ? const Center(
                      child: Text(
                      "No tasks",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ))
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        final todoTitle =
                            todoListProvider.todoList[index].title;
                        final todoDesc =
                            todoListProvider.todoList[index].description;
                        final todoIsDone =
                            todoListProvider.todoList[index].isDone;
                        return TodoWidget(
                            todo: Todo(
                                id: todoListProvider.todoList[index].id,
                                title: todoTitle,
                                description: todoDesc,
                                isDone: todoIsDone));
                      },
                      itemCount: todoListProvider.todoList.length),
            )
          ],
        ));
  }
}
