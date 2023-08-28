part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

//navigate
class NavigateToSecondScreenEvent extends TodoEvent{}

//add title
class AddTitleEvent extends TodoEvent{}

//delete title
class DeleteTitleEvent extends TodoEvent{}

