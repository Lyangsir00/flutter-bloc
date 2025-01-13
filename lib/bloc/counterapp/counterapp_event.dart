part of 'counterapp_bloc.dart';

abstract class CounterappEvent extends Equatable {
  const CounterappEvent();

  @override
  List<Object> get props => [];
}

class UpdateCounter extends CounterappEvent {
  final Color color;
  const UpdateCounter({
    required this.color,
  });
  @override
  // TODO: implement props
  List<Object> get props => [color];
}
