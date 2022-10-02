import 'package:go_router/go_router.dart';
import 'package:myquestlog/home_page.dart';
import 'package:myquestlog/login.dart';
<<<<<<< HEAD
import 'package:myquestlog/registro.dart';
=======
import 'package:myquestlog/user_page.dart';

import '../registro.dart';
>>>>>>> Master

final routes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: ((context, state) => Tela_Login()),
    ),
    GoRoute(
      path: '/login/registro',
      builder: ((context, state) => Registro()),
    ),
    GoRoute(
      path: '/login/homePage',
      builder: ((context, state) => HomePage()),
    ),
    GoRoute(
      path: '/registro/homePage',
      builder: ((context, state) => HomePage()),
    ),
<<<<<<< HEAD
=======
    GoRoute(
      path: '/user_page',
      builder: ((context, state) => const UserPage()),
    ),
>>>>>>> Master
    //pageBuilder: MaterialPage(child: Tela_Login()))
  ],
);
