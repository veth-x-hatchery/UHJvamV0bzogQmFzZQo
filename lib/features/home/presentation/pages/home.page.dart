import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vethx_beta/features/authorization/presentation/bloc/auth_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home sweet home'),
        leading: IconButton(
          key: const Key(SignInPageKeys.logOutHomePageButton),
          icon: const Icon(Icons.exit_to_app),
          onPressed: () {
            BlocProvider.of<AuthBloc>(context).add(const AuthEvent.signedOut());
          },
        ),
      ),
      body: Container(),
    );
  }
}
