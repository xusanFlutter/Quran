import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Tasbeh extends StatefulWidget {
  const Tasbeh({Key? key}) : super(key: key);

  @override
  State<Tasbeh> createState() => _TasbehState();
}

class _TasbehState extends State<Tasbeh> {
  int add = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/logo.png'),
        backgroundColor: Colors.green,
        title: const Text(
          'Tasbeh',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(height: 70),
              Padding(
                padding: const EdgeInsets.only(right: 50, left: 50),
                child: GestureDetector(
                  onLongPress: () {
                    setState(() {
                      HapticFeedback.lightImpact();
                      add = 1;
                    });
                  },
                  onTap: () {
                    setState(() {
                      HapticFeedback.lightImpact();
                      add++;
                    });
                  },
                  child: Container(
                    width: 250,
                    height: 300,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      children: [
                        const Icon(Icons.add, size: 100),
                        Text(
                          '$add',
                          style: const TextStyle(
                            fontSize: 100,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
