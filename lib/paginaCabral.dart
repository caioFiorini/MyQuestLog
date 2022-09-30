import 'package:flutter/material.dart';

class PaginaCabral extends StatefulWidget {
  const PaginaCabral({super.key});

  @override
  State<PaginaCabral> createState() => _PaginaCabralState();
}

class _PaginaCabralState extends State<PaginaCabral> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Página Lucas"),
      ),
    );
  }
}
