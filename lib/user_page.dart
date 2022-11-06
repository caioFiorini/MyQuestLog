import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/percent_indicator.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFfcf0cf),
      appBar: AppBar(
        backgroundColor: const Color(0xFF993300),
        automaticallyImplyLeading: true, //retira a seta de voltar
        elevation: 2,
        centerTitle: true,
        title: const Text(
          "My Quest Log",
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFF993300),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 110,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: Colors.black,
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: CircularPercentIndicator(
                radius: 90.0,
                lineWidth: 13.0,
                animation: true,
                percent: 0.3,
                center: const Text(
                  "30:00",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                footer: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "30:00",
                        style: TextStyle(fontSize: 45),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Card(
                            color: const Color(0xFFfcf0cf),
                            elevation: 0,
                            child: ElevatedButton(
                              onPressed: (() {}),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF993300),
                              ),
                              child: const Text(
                                "INICIAR",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )),
                    ]),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 90,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              color: Colors.white,
            ),
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.play_arrow,
                        size: 45,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  child: Text("Espaço para API"),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }
}
