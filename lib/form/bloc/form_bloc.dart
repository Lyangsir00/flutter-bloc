import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'form_event.dart';
part 'form_state.dart';

class FormBloc extends Bloc<FormEvent, FormStates> {
  FormBloc() : super(FormStates()) {
    on<NameChanged>((event, emit) {
      emit(
        state.copyWith(
          name: event.name,
          isValid: _validateForm(
            state.name,
            state.email,
            state.password,
          ),
        ),
      );
    });

    on<EmailChanged>((event, emit) {
      emit(
        state.copyWith(
          email: event.email,
          isValid: _validateForm(
            state.name,
            state.email,
            state.password,
          ),
        ),
      );
    });

    on<PasswordChanged>((event, emit) {
      emit(
        state.copyWith(
          password: event.password,
          isValid: _validateForm(
            state.name,
            state.email,
            state.password,
          ),
        ),
      );
    });

    on<FormSubmitted>(
      (event, emit) {
        if (state.isValid) {
          emit(
            state.copyWith(isSubmitted: true),
          );
        }
      },
    );
  }

  bool _validateForm(String name, String email, String password) {
    return name.isNotEmpty && email.contains('@') && password.length >= 6;
  }
}
