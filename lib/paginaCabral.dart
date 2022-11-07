import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:lottie/lottie.dart';

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
        appBar: AppBar(
          backgroundColor: const Color(0xFF993300),
          automaticallyImplyLeading: true, //retira a seta de voltar
          elevation: 2,
          centerTitle: true,
          title: const Text(
            "Atributos",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
            children: [
              Stack(
                  children: <Widget>[
                    Positioned(
                      right: 24.0,
                      top: 24.0,
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFF993300), width: 3),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                        child: const Text(
                          "13",
                          style: TextStyle(fontSize: 24, color: Color(0xFF993300)),
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
                            percent: 0.75,
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: const Color.fromRGBO(27, 75, 67, 1),
                            center: Lottie.asset(
                                'assets/images/user-animation.json',
                                height: 100,
                                fit:BoxFit.fill
                            )
                        ),
                      ),
                    )
                  ]
              ),
              const Text(
                "750 xp",
                style: TextStyle(fontSize: 32, color: Color.fromRGBO(27, 75, 67, 1), fontWeight: FontWeight.bold),
              ),
              Container(
                padding: const EdgeInsets.only(top: 64, bottom: 20),
                child: const Text(
                  "ATRIBUTOS",
                  style: TextStyle(fontSize: 32, color: Color(0xFF993300), fontWeight: FontWeight.bold),
                ),
              ),
              DefaultTextStyle(
                style: const TextStyle(fontSize: 18, color: Color(0xFF993300), fontWeight: FontWeight.bold),
                child:Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child:Column(
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
                                      percent: 0.70,
                                      progressColor: const Color(0xFF993300),
                                      barRadius: const Radius.circular(16),
                                    ),
                                  ),
                                  const Text(
                                      "Força"
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
                                      percent: 0.30,
                                      progressColor: const Color(0xFF993300),
                                      barRadius: const Radius.circular(16),
                                    ),
                                  ),
                                  const Text(
                                      "Destreza"
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
                                      percent: 0.20,
                                      progressColor: const Color(0xFF993300),
                                      barRadius: const Radius.circular(16),
                                    ),
                                  ),
                                  const Text(
                                      "Carisma"
                                  )
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
                                      percent: 0.15,
                                      progressColor: const Color(0xFF993300),
                                      barRadius: const Radius.circular(16),
                                    ),
                                  ),
                                  const Text(
                                      "Percep."
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
                                      percent: 0.45,
                                      progressColor: const Color(0xFF993300),
                                      barRadius: const Radius.circular(16),
                                    ),
                                  ),
                                  const Text(
                                      "Intelig."
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
                                      percent: 0.95,
                                      progressColor: const Color(0xFF993300),
                                      barRadius: const Radius.circular(16),
                                    ),
                                  ),
                                  const Text(
                                      "Agilidade"
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ]
                  ),
                ),
              )
            ]
        )
    );
  }
}
