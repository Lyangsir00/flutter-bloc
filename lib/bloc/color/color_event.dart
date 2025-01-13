part of 'color_bloc.dart';

class ColorEvent extends Equatable {
  const ColorEvent();

  @override
  List<Object> get props => [];
}

class ChangeColor extends ColorEvent {
  final Color color;

  const ChangeColor({
    required this.color,
  });
  @override
  // TODO: implement props
  List<Object> get props => [color];
}
