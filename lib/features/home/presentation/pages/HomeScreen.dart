import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_mind_application/core/common_widgets/ButtonWidget.dart';
import 'package:healthy_mind_application/features/auth/bloc/auth_bloc/auth_bloc.dart';
import 'package:healthy_mind_application/features/auth/bloc/login_bloc/login_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Home Screen'),
            ButtonWidget(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              text: 'Logout',
              type: ButtonType.primary,
            ),
          ],
        ),
      ),
    );
  }
}
