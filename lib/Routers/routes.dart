import 'package:go_router/go_router.dart';
import 'package:myquestlog/home_page.dart';
import 'package:myquestlog/login.dart';
import 'package:myquestlog/pagina_configuracao.dart';
import 'package:myquestlog/registro.dart';

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
      path: '/login/home_page',
      builder: ((context, state) => HomePage()),
    ),
    GoRoute(
      path: '/registro/home_page',
      builder: ((context, state) => HomePage()),
    ),
    GoRoute(
      path: '/user_page/pagina_configuracao',
      builder: ((context, state) => PageConfig()),
    )

    //pageBuilder: MaterialPage(child: Tela_Login()))
  ],
);
