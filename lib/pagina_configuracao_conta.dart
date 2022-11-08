import 'package:flutter/material.dart';

class ContaConfig extends StatefulWidget {
  const ContaConfig({super.key});

  @override
  State<ContaConfig> createState() => _ContaConfigState();
}

class _ContaConfigState extends State<ContaConfig> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2E2E2E),
      appBar: AppBar(
          backgroundColor: const Color(0xFF2E2E2E),
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "My Quest Log",
            style: TextStyle(color: Colors.white),
          ),
          iconTheme: const IconThemeData(color: Color(0xFFC99F0D))),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: const <Widget>[
          SizedBox(
            child: Text(
              "Digite o email para apagar a conta:",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
