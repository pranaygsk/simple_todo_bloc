import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_todo_bloc/features/todo/bloc/todo_bloc.dart';
import 'package:simple_todo_bloc/features/todo/ui/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TodoBloc todoBloc = TodoBloc();
  TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoBloc, TodoState>(
      bloc: todoBloc,
      listenWhen: (previous, current) => current is TodoActionState,
      buildWhen: (previous, current) => current is! TodoActionState,
      listener: (context, state) {
        if (state is NavigateToSecondScreenActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SecondScreen(
                todoBloc: todoBloc,
              ),
            ),
          );
        } else if (state is AddTitleActionState) {
          setState(() {});
        } else if(state is DeleteTitleActionState){
          setState(() {
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 400,
                    child: ListView.builder(
                      itemCount: todoBloc.titleList.length,
                      itemBuilder: (context, index) => ListTile(
                        title: Text(
                          todoBloc.titleList[index].toString(),
                        ),
                      ),
                    ),
                  ),
                  TextField(
                    controller: titleController,
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      todoBloc.add(NavigateToSecondScreenEvent());
                    },
                    child: const Text("Navigate"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      todoBloc.titleList.add(titleController.text);
                      todoBloc.add(AddTitleEvent());
                    },
                    child: const Text("Add Title"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      todoBloc.titleList.remove(titleController.text);
                      todoBloc.add(DeleteTitleEvent());
                    },
                    child: const Text("Delete Title"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
