part of 'form_bloc.dart';

class FormStates extends Equatable {
  final String name;
  final String email;
  final String password;
  final bool isValid;
  final bool isSubmitted;

  const FormStates({
    this.name = '',
    this.email = '',
    this.password = '',
    this.isValid = false,
    this.isSubmitted = false,
  });
  FormStates copyWith({
    String? name,
    String? email,
    String? password,
    bool? isValid,
    bool? isSubmitted,
  }) {
    return FormStates(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
      isSubmitted: isSubmitted ?? this.isSubmitted,
    );
  }

  @override
  List<Object> get props => [name, email, password, isValid, isSubmitted];
}
