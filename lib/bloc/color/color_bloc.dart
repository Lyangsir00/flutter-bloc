import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'color_event.dart';
part 'color_state.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  ColorBloc() : super(ColorState()) {
    on<ChangeColor>(_changeColor);
  }
  void _changeColor(ChangeColor event, Emitter<ColorState> emit) {
    try {
      if (event.color == Colors.transparent) {
        throw Exception("Transparent color is not allowed");
      }
      emit(
        state.copyWith(color: event.color),
      );
    } catch (e) {
      emit(
        state.copyWith(errorMsg: "Error:${e.toString()}"),
      );
    }
  }
}
