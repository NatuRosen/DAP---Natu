import 'package:go_router/go_router.dart';
import 'package:tp2/screens/home_screen.dart';
import 'package:tp2/screens/login_screen.dart';

final appRouter = GoRouter(initialLocation: '/loginScreen', routes: [
  GoRoute(
    path: '/loginScreen',
    builder: (context, state) => LoginScreen(),
  ),
  GoRoute(
    path: '/homeScreen',
    builder: (context, state) => HomeScreen(),
  )
]);
