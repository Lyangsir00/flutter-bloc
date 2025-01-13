import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example2/bloc/counterapp/counterapp_bloc.dart';
import 'package:flutter_bloc_example2/bloc/color/color_bloc.dart';

class BlocToBlocHome extends StatefulWidget {
  const BlocToBlocHome({super.key});

  @override
  State<BlocToBlocHome> createState() => _CounterappHomeState();
}

class _CounterappHomeState extends State<BlocToBlocHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BLoC to BLoC "),
      ),
      body: BlocListener<ColorBloc, ColorState>(
        listener: (context, state) {
          context.read<CounterappBloc>().add(
                UpdateCounter(color: state.color),
              );
        },
        child: BlocBuilder<ColorBloc, ColorState>(builder: (context, state) {
          return Container(
            height: 200,
            width: double.infinity,
            color: state.color,
            child: Center(
              child: BlocBuilder<CounterappBloc, CounterappState>(
                builder: (context, state) {
                  return Text(
                    state.counter.toString(),
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink),
                  );
                },
              ),
            ),
          );
        }),
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
              style: TextStyle(color: Colors.green),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<ColorBloc>().add(ChangeColor(color: Colors.blue));
            },
            child: Text("Blue", style: TextStyle(color: Colors.blue)),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<ColorBloc>().add(ChangeColor(color: Colors.red));
            },
            child: Text(
              "Red",
              style: TextStyle(color: Colors.red),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<ColorBloc>().add(ChangeColor(color: Colors.black));
            },
            child: Text(
              "Black",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
