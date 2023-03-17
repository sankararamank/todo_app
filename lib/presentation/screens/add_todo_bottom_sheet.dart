import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/todos_bloc.dart';
import 'package:todo_app/constants/global_constants.dart';
import 'package:todo_app/data/model/todo.dart';
import 'package:todo_app/presentation/widgets/button.dart';

class AddTodoBottomSheet extends StatefulWidget {
  const AddTodoBottomSheet({super.key});

  @override
  State<AddTodoBottomSheet> createState() => _AddTodoBottomSheetState();
}

class _AddTodoBottomSheetState extends State<AddTodoBottomSheet> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(PaddingConstants.medium),
      child: Column(
        children: [
          const Text(
            TextConstants.addNewTodo,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: PaddingConstants.medium),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 5 * PaddingConstants.extraSmall,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(BorderRadiusConstants.small),
            ),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  border: InputBorder.none,
                  hintText: TextConstants.title,
                  hintStyle: TextStyle(color: grey)),
            ),
          ),
          const SizedBox(height: PaddingConstants.small),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButton(
                text: TextConstants.save,
                onPressed: () {
                  Todo todo = Todo(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    title: controller.text,
                  );
                  context.read<TodosBloc>().add(AddTodoEvent(todo: todo));
                  Navigator.of(context).pop();
                },
              ),
              const SizedBox(width: PaddingConstants.small),
              CustomButton(
                text: TextConstants.close,
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
