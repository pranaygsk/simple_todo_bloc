import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<NavigateToSecondScreenEvent>(navigateToSecondScreenEvent);
    on<AddTitleEvent>(addTitleEvent);
    on<DeleteTitleEvent>(deleteTitleEvent);
  }

  List<String> titleList=[];

  FutureOr<void> navigateToSecondScreenEvent(NavigateToSecondScreenEvent event, Emitter<TodoState> emit) {
    emit(NavigateToSecondScreenActionState());
  }

  FutureOr<void> addTitleEvent(AddTitleEvent event, Emitter<TodoState> emit) {
    // titleList.add(title);
    emit(AddTitleActionState());
  }

  FutureOr<void> deleteTitleEvent(DeleteTitleEvent event, Emitter<TodoState> emit) {
    // titleList.remove(title);
    emit(DeleteTitleActionState());
  }
}
