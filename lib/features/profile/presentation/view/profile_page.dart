import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_event.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OutlinedButton.icon(
          onPressed: () => context.read<AuthBloc>().add(const AuthEvent.logoutRequested()),
          icon: const Icon(Icons.logout),
          label: const Text('Log out'),
        ),
      ),
    );
  }
}
