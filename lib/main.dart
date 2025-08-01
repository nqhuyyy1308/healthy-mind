import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_mind_application/core/routes/Navigators.dart';
import 'package:healthy_mind_application/core/services/simple_bloc_observer.dart';
import 'package:healthy_mind_application/core/themes/AppMaterialColors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:healthy_mind_application/core/user_module/data/repositories/user_repository_impl.dart';
import 'package:healthy_mind_application/core/user_module/domain/repositories/user_repository.dart';
import 'package:healthy_mind_application/features/auth/bloc/auth_bloc/auth_bloc.dart';
import 'package:healthy_mind_application/features/auth/presentation/pages/LoginScreen.dart';
import 'package:healthy_mind_application/features/home/presentation/pages/HomeScreen.dart';
import 'package:healthy_mind_application/features/intro/presentation/pages/OnboardingScreen.dart';
import 'package:healthy_mind_application/features/intro/presentation/pages/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp(UserRepositoryImpl()));
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;
  const MyApp(this.userRepository, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => AuthBloc(myUserRepository: userRepository),
        ),
      ],
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Healthy Mind Application',
            theme: ThemeData(primarySwatch: MaterialColors.primarySwatch),
            routerConfig: appRouter,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
