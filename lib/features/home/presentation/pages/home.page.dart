import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/auth/auth_bloc.dart';

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
            BlocProvider.of<AuthBloc>(context).add(const AuthEvent.signedOut());
          },
        ),
      ),
      body: const Center(
        child: Text('Logged in'),
      ),
    );
  }
}
