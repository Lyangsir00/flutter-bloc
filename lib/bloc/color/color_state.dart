part of 'color_bloc.dart';

class ColorState extends Equatable {
  final Color color;
  final String errorMsg;
  const ColorState({
    this.color = Colors.white,
    required this.errorMsg,
  });
  ColorState copyWith({Color? color, String? errorMsg}) {
    return ColorState(
        color: color ?? this.color, errorMsg: errorMsg ?? this.errorMsg);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [color, errorMsg];
}
