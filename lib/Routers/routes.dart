import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myquestlog/homePage.dart';
import 'package:myquestlog/login.dart';
import 'package:myquestlog/user_page.dart';

import '../registro.dart';

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
    GoRoute(
      path: '/user_page',
      builder: ((context, state) => const UserPage()),
    ),
    //pageBuilder: MaterialPage(child: Tela_Login()))
  ],
);
