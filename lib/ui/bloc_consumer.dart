import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example2/bloc/color/color_bloc.dart';
import 'package:flutter_bloc_example2/bloc/counterapp/counterapp_bloc.dart';

class BlocConsumerPage extends StatefulWidget {
  const BlocConsumerPage({super.key});

  @override
  State<BlocConsumerPage> createState() => _BlocConsumerState();
}

class _BlocConsumerState extends State<BlocConsumerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" BLoC using BLoC Consumer"),
      ),
      body: BlocConsumer<ColorBloc, ColorState>(
        listener: (context, state) {
          context.read<CounterappBloc>().add(
                UpdateCounter(color: state.color),
              );
        },
        builder: (context, state) {
          final counterState = context.watch<CounterappBloc>().state;
          return Container(
            height: 200,
            width: double.infinity,
            color: state.color,
            child: Center(
              child: Text(counterState.counter.toString()),
            ),
          );
        },
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {
              context.read<ColorBloc>().add(ChangeColor(color: Colors.green));
            },
            child: Text(
              "Green",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                context.read<ColorBloc>().add(ChangeColor(color: Colors.blue));
              },
              child: Text(
                "Blue",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              )),
          ElevatedButton(
              onPressed: () {
                context.read<ColorBloc>().add(ChangeColor(color: Colors.red));
              },
              child: Text(
                "Red",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              )),
          ElevatedButton(
            onPressed: () {
              context.read<ColorBloc>().add(ChangeColor(color: Colors.black));
            },
            child: Text(
              "Black",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
