import 'package:flutter/material.dart';
import 'package:rentacar/drawer.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE3E2E2),
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: const Text('Rent A Car',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Center(
        child: Text('Home Page'),
      ),
      drawer: buildDrawer(context),
    );
  }
}

