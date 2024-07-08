import 'package:go_router/go_router.dart';
import 'package:tp_cierre_cuatri/screens/description_screen.dart';
import 'package:tp_cierre_cuatri/screens/home_screen.dart';
import 'package:tp_cierre_cuatri/screens/login_screen.dart';

final appRouter = GoRouter(initialLocation: '/loginScreen', routes: [
  GoRoute(
    name: LoginScreen.name,
    path: '/loginScreen',
    builder: (context, state) => LoginScreen(),
  ),
  GoRoute(
    name: HomeScreen.name,
    path: '/homeScreen',
    builder: (context, state) => HomeScreen(),
  ),
  
  GoRoute(
    name: DescriptionScreen.name,
    path: '/descriptionScreen',
    builder: (context, state) => DescriptionScreen(descripcion: state.extra as dynamic),
  ),
]);