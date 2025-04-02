part of 'add_note_cubit_cubit.dart';


abstract class AddNoteCubitState {}

 class AddNoteInitial extends AddNoteCubitState {}
 class AddNoteLoading extends AddNoteCubitState {}
 class AddNoteSuccess extends AddNoteCubitState {}
 class AddNoteFailure extends AddNoteCubitState {
  final String errMessage;
  
  AddNoteFailure(this.errMessage);
}
