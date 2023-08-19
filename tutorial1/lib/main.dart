import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'My App',
      home: SafeArea(
        child: MyScaffold(),
      ),
    ),
  );
}

class MyAppBar extends StatelessWidget{
  const MyAppBar({required this.title, super.key});

  final Widget title;

  @override
  Widget build(BuildContext context){
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(color: Colors.blue[500]),
      child: Row(
        children: [
          const IconButton(
            icon: Icon(Icons.menu),
            iconSize: 30,
            tooltip: 'Navigation menu',
            onPressed: null,
          ),
          Expanded(
            child: title,
          ),
          const IconButton(
            icon: Icon(Icons.search),
            iconSize: 30,
            tooltip: 'Search',
            onPressed: null,
          )
        ],
      )
    );
  }
}

class MyScaffold extends StatelessWidget{
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context){
    return const Material(
      child: Column(
        children: [
          MyAppBar(
            title: Text(
              'Slm',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white),
            )
          ),
          Expanded(
            child: Center(
              child: Text(
                'Hello!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
            ),
          )
        ],
      )
    );
  }
}