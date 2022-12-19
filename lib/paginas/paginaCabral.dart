import 'package:flutter/material.dart';
import 'package:myquestlog/main.dart';

import 'package:percent_indicator/percent_indicator.dart';
import 'package:lottie/lottie.dart';
import 'package:myquestlog/Routers/routes.dart';
import 'package:go_router/go_router.dart';

class PaginaCabral extends StatefulWidget {
  const PaginaCabral({super.key});

  @override
  State<PaginaCabral> createState() => _PaginaCabralState();
}

double attrPadding = 25;

class _PaginaCabralState extends State<PaginaCabral> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF2E2E2E),
        appBar: AppBar(
          backgroundColor: const Color(0xFF2E2E2E),
          automaticallyImplyLeading: true, //retira a seta de voltar
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Seus Status",
            style: TextStyle(color: Colors.white),
          ),
          iconTheme: const IconThemeData(color: Color(0xFFC99F0D)),
        ),
        drawer: Drawer(
          backgroundColor: const Color(0xFF2E2E2E),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const SizedBox(
                height: 110,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color(0xFF606060),
                  ),
                  child: Text(
                    'Menu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: TextButton(
                  onPressed: () => context.push(
                      '/user_page/pagina_configuracao'), //modificar para ir para a página
                  child: const Text(
                    "Configuração",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                iconColor: Colors.white,
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(children: [
                Stack(children: <Widget>[
                  Positioned(
                    right: 24.0,
                    top: 24.0,
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xFFC99F0D), width: 3),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(100),
                        ),
                      ),
                      child: Text(
                        "${usuario.nivel}",
                        style: const TextStyle(
                            fontSize: 24, color: Color(0xFFC99F0D)),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 64, bottom: 16),
                    child: Center(
                      child: CircularPercentIndicator(
                          radius: 90.0,
                          lineWidth: 13.0,
                          animation: true,
                          percent: (usuario.xp / (100 * usuario.nivel)),
                          circularStrokeCap: CircularStrokeCap.round,
                          backgroundColor: const Color(0xFF606060),
                          progressColor: const Color(0xFFC99F0D),
                          center: Lottie.asset(
                              'assets/images/user-animation.json',
                              height: 100,
                              fit: BoxFit.fill)),
                    ),
                  )
                ]),
                Text(
                  "${usuario.xp} xp",
                  style: const TextStyle(
                      fontSize: 32,
                      color: Color(0xFFC99F0D),
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 64, bottom: 20),
                  child: const Text(
                    "ATRIBUTOS",
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                DefaultTextStyle(
                  style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFF606060),
                      fontWeight: FontWeight.bold),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(attrPadding),
                                child: Column(
                                  children: [
                                    RotatedBox(
                                      quarterTurns: -1,
                                      child: LinearPercentIndicator(
                                        width: 100,
                                        lineHeight: 8,
                                        animation: true,
                                        percent: usuario.atributos.forca / 100,
                                        backgroundColor:
                                            const Color(0xFF606060),
                                        progressColor: const Color(0xFFC99F0D),
                                        barRadius: const Radius.circular(16),
                                      ),
                                    ),
                                    const Text(
                                      "Força",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(attrPadding),
                                child: Column(
                                  children: [
                                    RotatedBox(
                                      quarterTurns: -1,
                                      child: LinearPercentIndicator(
                                        width: 100,
                                        lineHeight: 8,
                                        animation: true,
                                        percent:
                                            usuario.atributos.destreza / 100,
                                        backgroundColor:
                                            const Color(0xFF606060),
                                        progressColor: const Color(0xFFC99F0D),
                                        barRadius: const Radius.circular(16),
                                      ),
                                    ),
                                    const Text("Destreza",
                                        style: TextStyle(color: Colors.white))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(attrPadding),
                                child: Column(
                                  children: [
                                    RotatedBox(
                                      quarterTurns: -1,
                                      child: LinearPercentIndicator(
                                        width: 100,
                                        lineHeight: 8,
                                        animation: true,
                                        percent:
                                            usuario.atributos.carisma / 100,
                                        backgroundColor:
                                            const Color(0xFF606060),
                                        progressColor: const Color(0xFFC99F0D),
                                        barRadius: const Radius.circular(16),
                                      ),
                                    ),
                                    const Text("Carisma",
                                        style: TextStyle(color: Colors.white))
                                  ],
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(attrPadding),
                                child: Column(
                                  children: [
                                    RotatedBox(
                                      quarterTurns: -1,
                                      child: LinearPercentIndicator(
                                        width: 100,
                                        lineHeight: 8,
                                        animation: true,
                                        percent:
                                            usuario.atributos.percepcao / 100,
                                        backgroundColor:
                                            const Color(0xFF606060),
                                        progressColor: const Color(0xFFC99F0D),
                                        barRadius: const Radius.circular(16),
                                      ),
                                    ),
                                    const Text("Percep.",
                                        style: TextStyle(color: Colors.white))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(attrPadding),
                                child: Column(
                                  children: [
                                    RotatedBox(
                                      quarterTurns: -1,
                                      child: LinearPercentIndicator(
                                        width: 100,
                                        lineHeight: 8,
                                        animation: true,
                                        percent: usuario.atributos.inteligencia / 100,
                                        backgroundColor:
                                            const Color(0xFF606060),
                                        progressColor: const Color(0xFFC99F0D),
                                        barRadius: const Radius.circular(16),
                                      ),
                                    ),
                                    const Text("Intelig.",
                                        style: TextStyle(color: Colors.white))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(attrPadding),
                                child: Column(
                                  children: [
                                    RotatedBox(
                                      quarterTurns: -1,
                                      child: LinearPercentIndicator(
                                        width: 100,
                                        lineHeight: 8,
                                        animation: true,
                                        percent:
                                            usuario.atributos.agilidade / 100,
                                        backgroundColor:
                                            const Color(0xFF606060),
                                        progressColor: const Color(0xFFC99F0D),
                                        barRadius: const Radius.circular(16),
                                      ),
                                    ),
                                    const Text("Agilidade",
                                        style: TextStyle(color: Colors.white))
                                  ],
                                ),
                              )
                            ],
                          )
                        ]),
                  ),
                )
              ])
            ],
          ),
        ));
  }
}
