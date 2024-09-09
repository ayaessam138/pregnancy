part of 'notes_cubit.dart';

@immutable
abstract class NotesState {}

class NotesInitial extends NotesState {}

class GetNotesInitial extends NotesState {}

class GetNotesLoading extends NotesState {}

class GetNotesSucess extends NotesState {}
class GetNotesFail extends NotesState {
  final  String Message;

  GetNotesFail({required this.Message});
}

class AddNotesLoading extends NotesState {}

class AddNotesSucess extends NotesState {}

class AddNotesFail extends NotesState {
final  String Message;

  AddNotesFail({required this.Message});
}


class DeleteNotesSucess extends NotesState {}

class DeleteNotesFail extends NotesState {
  final  String Message;

  DeleteNotesFail({required this.Message});
}
class EditNotesSucess extends NotesState {}

class EditNotesFail extends NotesState {
  final  String Message;

  EditNotesFail({required this.Message});
}