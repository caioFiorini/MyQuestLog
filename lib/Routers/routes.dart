import 'package:go_router/go_router.dart';
import 'package:myquestlog/paginas/home_page.dart';
import 'package:myquestlog/paginas/login.dart';
import 'package:myquestlog/paginas/pagina_configuracao.dart';
import 'package:myquestlog/paginas/pagina_configuracao_conta.dart';
import 'package:myquestlog/paginas/registro.dart';

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
    ),
    GoRoute(
      path: '/pagina_configuracao/pagina_configuracao_conta',
      builder: ((context, state) => ContaConfig()),
    )

    //pageBuilder: MaterialPage(child: Tela_Login()))
  ],
);
