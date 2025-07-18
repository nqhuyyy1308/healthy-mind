import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_mind_application/core/routes/Navigators.dart';
import 'package:healthy_mind_application/core/themes/AppMaterialColors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:healthy_mind_application/features/auth/bloc/auth_bloc.dart';
import 'package:healthy_mind_application/features/auth/data/datasources/local_data_source.dart';
import 'package:healthy_mind_application/features/auth/data/repositories/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final sf = await SharedPreferences.getInstance();
  runApp(MyApp(sharedPreferences: sf));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(
        firebaseAuth: FirebaseAuth.instance,
        authLocalDataSource: AuthLocalDataSource(sf: sharedPreferences),
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthLoginBloc(context.read<AuthRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                AuthRegisterBloc(context.read<AuthRepository>()),
          ),
        ],
        child: MaterialApp.router(
          title: 'Healthy Mind Application',
          theme: ThemeData(primarySwatch: MaterialColors.primarySwatch),
          routerConfig: appRouter,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
