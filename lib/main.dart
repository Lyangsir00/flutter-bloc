import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example2/bloc/counterapp/counterapp_bloc.dart';
import 'package:flutter_bloc_example2/bloc/color/color_bloc.dart';
import 'package:flutter_bloc_example2/ui/bloc_to_bloc_home.dart';
// <<<<<<< HEAD
import 'package:flutter_bloc_example2/ui/stream.dart';
// =======
// >>>>>>> f4a9663 (feat: implement bloc-tobloc communication using BLoClistener)

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ColorBloc(),
        ),
        BlocProvider(
          create: (context) => CounterappBloc(),
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
// <<<<<<< HEAD
          home: StreamPage()
// ======

// >>>>>>> f4a9663 (feat: implement bloc-tobloc communication using BLoClistener)
          ),
    );
  }
}
