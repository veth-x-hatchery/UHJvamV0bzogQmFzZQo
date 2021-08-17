import 'package:flutter/material.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/auth/auth_bloc.dart';
import 'package:vethx_beta/injection_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        leading: IconButton(
          icon: const Icon(Icons.exit_to_app),
          onPressed: () {
            sl<AuthBloc>().add(const AuthEvent.signedOut());
          },
        ),
      ),
      body: const Center(
        child: Text('Logged in'),
      ),
    );
  }
}
