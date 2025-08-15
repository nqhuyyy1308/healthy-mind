import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_mind_application/core/routes/Navigators.dart';
import 'package:healthy_mind_application/core/services/simple_bloc_observer.dart';
import 'package:healthy_mind_application/core/themes/AppMaterialColors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:healthy_mind_application/core/user_module/data/repositories/user_repository_impl.dart';
import 'package:healthy_mind_application/core/user_module/domain/repositories/user_repository.dart';
import 'package:healthy_mind_application/features/appointment/bloc/get_doctors_bloc/get_doctors_bloc.dart';
import 'package:healthy_mind_application/features/appointment/data/repositories/doctor_repository_impl.dart';
import 'package:healthy_mind_application/features/appointment/domain/repositories/doctor_repository.dart';
import 'package:healthy_mind_application/features/auth/bloc/auth_bloc/auth_bloc.dart';
import 'package:healthy_mind_application/features/auth/bloc/user_bloc/user_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp(UserRepositoryImpl(), DoctorRepositoryImpl()));
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;
  final DoctorRepository doctorRepository;
  const MyApp(this.userRepository, this.doctorRepository, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => AuthBloc(myUserRepository: userRepository),
        ),
        RepositoryProvider(
          create: (_) => UserBloc(myUserRepository: userRepository),
        ),
        RepositoryProvider(
          create: (_) =>
              GetDoctorsBloc(doctorRepository: DoctorRepositoryImpl())
                ..add(GetDoctors()),
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
