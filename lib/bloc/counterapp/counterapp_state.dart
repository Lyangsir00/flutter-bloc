part of 'counterapp_bloc.dart';

class CounterappState extends Equatable {
  final int counter;
  const CounterappState({this.counter = 0});

  CounterappState copyWith({
    int? counter,
  }) {
    return CounterappState(
      counter: counter ?? this.counter,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [counter];
}
