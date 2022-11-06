import 'package:flutter/material.dart';

class PageJuliana extends StatefulWidget {
  const PageJuliana({super.key});

  @override
  State<PageJuliana> createState() => _PageJulianaState();
}

class _PageJulianaState extends State<PageJuliana> {
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
          "Tarefas",
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFF993300),
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            SizedBox(
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
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              iconColor: Colors.white,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              color: Colors.white,
            ),
            margin: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: const Text(
                          "Tarefa1",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 10,
                        ),
                        child: const Text("Ir para academia"),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              color: Colors.white,
            ),
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: const Text(
                          "Tarefa2",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 10,
                        ),
                        child: const Text("Estudar Flutter"),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text(
          "+",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        backgroundColor: const Color(0xFF993300),
      ),
    );
  }
}
