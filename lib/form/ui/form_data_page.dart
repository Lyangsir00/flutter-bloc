import 'package:flutter/material.dart';
import 'package:flutter_bloc_example2/form/bloc/form_bloc.dart';

class FormDataPage extends StatelessWidget {
  final FormStates state;
  const FormDataPage({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text("Name:${state.name}"),
            Text("email:${state.email}"),
            Text("Password:${state.password}")
          ],
        ),
      ),
    );
  }
}
