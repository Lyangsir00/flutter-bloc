import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'counterapp_event.dart';
part 'counterapp_state.dart';

class CounterappBloc extends Bloc<CounterappEvent, CounterappState> {
  CounterappBloc() : super(CounterappState()) {
    on<UpdateCounter>(_updateCounter);
  }

  void _updateCounter(UpdateCounter event, Emitter<CounterappState> emit) {
    int increment;
    if (event.color == Colors.black) {
      increment = 100;
    } else if (event.color == Colors.green) {
      increment = 200;
    } else if (event.color == Colors.red) {
      increment = -100;
    } else if (event.color == Colors.blue) {
      increment = 10;
    } else {
      increment = 0;
    }
    emit(
      state.copyWith(counter: state.counter + increment),
    );
  }
}
