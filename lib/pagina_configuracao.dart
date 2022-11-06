import 'package:flutter/material.dart';

class PageConfig extends StatefulWidget {
  const PageConfig({super.key});

  @override
  State<PageConfig> createState() => PageConfigState();
}

class PageConfigState extends State<PageConfig> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFfcf0cf),
      appBar: AppBar(
        backgroundColor: const Color(0xFF993300),
        elevation: 2,
        centerTitle: true,
        title: const Text(
          "My Quest Log",
          style: TextStyle(color: Colors.white),
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
                          "Conta",
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
                        child: ElevatedButton(
                          onPressed: () => {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF993300),
                          ),
                          child: const Text(
                            "Apagar Conta",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
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
          ),
        ],
      ),
    );
  }
}
