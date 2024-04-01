import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Create a MaterialApp and return it
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('GridView Example'),
        ),
        body: GridView.count(
          // Number of columns in the grid
          crossAxisCount: 3,
          // Generate 100 widgets for the grid
          children: List.generate(100, (index) {
            // Return a widget for each grid item
            return Center(
              child: Text(
                'Item $index',
                style: TextStyle(fontSize: 16),
              ),
            );
          }),
        ),
      ),
    );
  }
}

