import 'package:go_router/go_router.dart';
import 'package:healthy_mind_application/features/auth/presentation/pages/RegisterScreen.dart';
import 'package:healthy_mind_application/features/intro/presentation/pages/splashScreen.dart';
import '../../features/auth/presentation/pages/LoginScreen.dart';
import '../../features/home/presentation/pages/HomeScreen.dart';
import '../../features/intro/presentation/pages/OnboardingScreen.dart';

const String homeScreen = '/home';
const String loginScreen = '/login';
const String registerScreen = '/login/register';
const String onboardingScreen = '/onboarding';

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
      builder: (context, state) => const LoginScreen(),
      routes: [
        GoRoute(
          path: 'register',
          name: 'RegisterScreen',
          builder: (context, state) => const RegisterScreen(),
        ),
      ],
    ),
    GoRoute(
      path: '/home',
      name: 'HomeScreen',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
