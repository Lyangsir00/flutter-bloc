part of 'counterapp_bloc.dart';

class CounterappState extends Equatable {
  final int counter;
  final String errorMsg;
  const CounterappState({this.counter = 0, this.errorMsg = ''});

  CounterappState copyWith({
    int? counter,
    String? errorMsg,
  }) {
    return CounterappState(
      counter: counter ?? this.counter,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [counter, errorMsg];
}
