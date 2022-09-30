import 'package:flutter/material.dart';
import 'package:myquestlog/main.dart';

class PageVito extends StatefulWidget {
  const PageVito({super.key});

  @override
  State<PageVito> createState() => _PageVitoState();
}

class _PageVitoState extends State<PageVito> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Página Vito"),
      ),
    );
  }
}
