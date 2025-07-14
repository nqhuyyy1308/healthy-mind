import 'package:go_router/go_router.dart';
import 'package:healthy_mind_application/features/intro/presentation/pages/splashScreen.dart';
import '../../features/auth/presentation/pages/LoginScreen.dart';
import '../../features/home/presentation/pages/HomeScreen.dart';
import '../../features/intro/presentation/pages/OnboardingScreen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: "/",
  routes: [
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
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      name: 'HomeScreen',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
