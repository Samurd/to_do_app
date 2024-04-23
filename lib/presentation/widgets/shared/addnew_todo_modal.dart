import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/domain/entities/todo.dart';
import 'package:to_do_app/presentation/providers/todo_List_provider.dart';
import 'package:to_do_app/presentation/widgets/shared/text_field_widget.dart';

class AddNewTodoModal extends StatelessWidget {
  const AddNewTodoModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final todoListProvider = context.watch<TodoListProvider>();

    final colors = Theme.of(context).colorScheme;
    final nameController = TextEditingController();
    final descriptionController = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 0.70,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: double.infinity,
              child: Text(
                "Add New Task",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: colors.primary),
                textAlign: TextAlign.center,
              )),
          Divider(
            thickness: 1,
            color: Colors.grey[700],
          ),
          Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Title Task",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 5),
                  TextFieldWidget(
                      hintText: "Add Task name",
                      maxLines: 1,
                      controller: nameController),
                  const SizedBox(height: 20),
                  const Text("Description Task",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 5),
                  TextFieldWidget(
                      hintText: "Add Task description",
                      maxLines: 3,
                      controller: descriptionController),
                ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.grey[100]),
                        foregroundColor:
                            MaterialStateProperty.all(colors.primary),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancel"))),
              const SizedBox(width: 20),
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        if (nameController.text.isEmpty) {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Task name can't be empty"),
                          ));

                          return;
                        }
                        final newTodo = Todo(
                            id: todoListProvider.todoList.length + 1,
                            title: nameController.text,
                            description: descriptionController.text.isNotEmpty
                                ? descriptionController.text
                                : null);

                        todoListProvider.addTodo(newTodo);

                        Navigator.pop(context);
                      },
                      child: const Text("Create")))
            ],
          )
        ],
      ),
    );
  }
}
