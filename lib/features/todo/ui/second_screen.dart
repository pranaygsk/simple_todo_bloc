import 'package:flutter/material.dart';
import 'package:simple_todo_bloc/features/todo/bloc/todo_bloc.dart';

class SecondScreen extends StatefulWidget {
  final TodoBloc todoBloc;
  const SecondScreen({super.key, required this.todoBloc});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
