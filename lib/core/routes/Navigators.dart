import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:healthy_mind_application/features/auth/bloc/auth_bloc/auth_bloc.dart';
import 'package:healthy_mind_application/features/auth/bloc/bloc/welcome_bloc.dart';
import 'package:healthy_mind_application/features/auth/bloc/login_bloc/login_bloc.dart';
import 'package:healthy_mind_application/features/auth/bloc/register_bloc/register_bloc.dart';
import 'package:healthy_mind_application/features/auth/presentation/pages/RegisterScreen.dart';
import 'package:healthy_mind_application/features/auth/presentation/widgets/WellcomeScreen.dart';
import 'package:healthy_mind_application/features/intro/presentation/pages/splashScreen.dart';
import '../../features/auth/presentation/pages/LoginScreen.dart';
import '../../features/home/presentation/pages/HomeScreen.dart';
import '../../features/intro/presentation/pages/OnboardingScreen.dart';

const String splashScreen = '/';
const String homeScreen = '/home';
const String loginScreen = '/login';
const String registerScreen = '/login/register';
const String onboardingScreen = '/onboarding';
const String wellcomeScreen = '/wellcome';

final GoRouter appRouter = GoRouter(
  initialLocation: "/",
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'SplashScreen',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      name: 'OnboardingScreen',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/login',
      name: 'LoginScreen',
      builder: (context, state) {
        return BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(
            myUserRepository: context.read<AuthBloc>().userRepository,
          ),
          child: const LoginScreen(),
        );
      },
      routes: [
        GoRoute(
          path: 'register',
          name: 'RegisterScreen',
          builder: (context, state) {
            // Cách bố trí Provider trực tiếp trong goRouter, Nếu để Provider bên trong file RegisterScreen.dart thì sẽ bị lỗi ProviderNotFoundException (Error: Could not find the correct Provider<RegisterBloc> above this RegisterScreen Widget)
            return BlocProvider<RegisterBloc>(
              // QUAN TRỌNG: ĐÂY LÀ CÁCH BỌC PROVIDER Ở CẤP CAO HƠN TRONG SCREEN THAY VÌ DÙNG MULTIPROVIDER Ở MAIN.DART
              create: (context) => RegisterBloc(
                myUserRepository: context.read<AuthBloc>().userRepository,
              ),
              child: const RegisterScreen(),
            );
          },
        ),
      ],
    ),
    GoRoute(
      path: '/home',
      name: 'HomeScreen',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/wellcome',
      name: 'WellcomeScreen',
      builder: (context, state) {
        final WellcomeState initialState = state.extra as WellcomeState;

        return BlocProvider(
          create: (context) => WellcomeBloc(initialState),
          child: const WellcomeScreen(),
        );
      },
    ),
  ],
);
