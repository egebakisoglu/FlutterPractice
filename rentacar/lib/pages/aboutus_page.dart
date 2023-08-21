import 'package:flutter/material.dart';
import 'package:rentacar/drawer.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[330],
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
        child: Text('About Us Page'),
      ),
      drawer: buildDrawer(context),
    );
  }
}
