part of 'todo_bloc.dart';

@immutable
abstract class TodoState {}

abstract class TodoActionState extends TodoState{}

class TodoInitial extends TodoState {}

//navigate
class NavigateToSecondScreenActionState extends TodoActionState{}

//add Title
class AddTitleActionState extends TodoActionState{}

//delete Title
class DeleteTitleActionState extends TodoActionState{}