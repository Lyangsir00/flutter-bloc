part of 'color_bloc.dart';

class ColorState extends Equatable {
  final Color color;
  const ColorState({
    this.color = Colors.white,
  });
  ColorState copyWith({Color? color}) {
    return ColorState(color: color ?? this.color);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [color];
}
