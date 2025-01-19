import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example2/form/bloc/form_bloc.dart';
import 'package:flutter_bloc_example2/form/ui/form_data_page.dart';

class FormHomeScreen extends StatefulWidget {
  const FormHomeScreen({super.key});

  @override
  State<FormHomeScreen> createState() => _FormHomeScreenState();
}

class _FormHomeScreenState extends State<FormHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Validation"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          children: [
            BlocConsumer<FormBloc, FormStates>(
              listener: (context, state) {
                if (state.isSubmitted && state.isValid) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FormDataPage(
                        state: state,
                      ),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return TextFormField(
                  onChanged: (value) => context.read<FormBloc>().add(
                        NameChanged(value),
                      ),
                  decoration: InputDecoration(
                    label: const Text('Name'),
                    errorText: state.name.isEmpty && state.isSubmitted
                        ? "Name is required"
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            BlocConsumer<FormBloc, FormStates>(
              listener: (context, state) {},
              builder: (context, state) {
                return TextFormField(
                  onChanged: (value) => context.read<FormBloc>().add(
                        EmailChanged(value),
                      ),
                  decoration: InputDecoration(
                    label: Text('Email'),
                    errorText:
                        state.email.isNotEmpty && !state.email.contains('@')
                            ? 'Invalid email'
                            : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            BlocConsumer<FormBloc, FormStates>(
              listener: (context, state) {},
              builder: (context, state) {
                return TextFormField(
                  obscureText: true,
                  onChanged: (value) => context.read<FormBloc>().add(
                        PasswordChanged(value),
                      ),
                  decoration: InputDecoration(
                    hintText: 'Password',
                    errorText:
                        state.password.isNotEmpty && state.password.length < 6
                            ? "Password is too short"
                            : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            BlocConsumer<FormBloc, FormStates>(
              listener: (context, state) {
                if (state.isSubmitted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Form Submitted Successfully!')),
                  );
                }
              },
              builder: (context, state) {
                return InkWell(
                  onTap: state.isValid
                      ? () {
                          context.read<FormBloc>().add(FormSubmitted());
                        }
                      : null,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 30,
                    ),
                    decoration: BoxDecoration(
                      color: state.isValid ? Colors.blue : Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
