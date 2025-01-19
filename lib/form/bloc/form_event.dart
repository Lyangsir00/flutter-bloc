part of 'form_bloc.dart';

abstract class FormEvent extends Equatable {
  const FormEvent();

  @override
  List<Object> get props => [];
}

class NameChanged extends FormEvent {
  final String name;
  const NameChanged(
    this.name,
  );
  @override
  // TODO: implement props
  List<Object> get props => [name];
}

class EmailChanged extends FormEvent {
  final String email;
  const EmailChanged(
    this.email,
  );
  @override
  // TODO: implement props
  List<Object> get props => [email];
}

class PasswordChanged extends FormEvent {
  final String password;
  const PasswordChanged(
    this.password,
  );
  @override
  // TODO: implement props
  List<Object> get props => [password];
}

class FormSubmitted extends FormEvent {}
