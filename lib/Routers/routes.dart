import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myquestlog/home_page.dart';
import 'package:myquestlog/login.dart';

final routes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: ((context, state) => Tela_Login()),
    ),
    //pageBuilder: MaterialPage(child: Tela_Login()))
  ],
);
