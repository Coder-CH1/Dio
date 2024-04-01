import 'package:flutter/material.dart';

class Gridhomepage extends StatelessWidget {
  const Gridhomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(appBar: AppBar(
        title: Text("Pix Gallerie"),
    ) ,
        body: Container(
          color: Colors.grey,
          child: GridView.count(crossAxisCount: 3,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            padding: EdgeInsets.all(10.0),
            children:
                List.generate(100, (index) {
                  return Container(
                    color: Colors.black12,
                    child: Center(
                     child: Text('chi',
                     style: TextStyle(fontSize: 16),
                     ),
                    ),
                  );
                }
                )
          ),
        ),
      )
    );
  }
}
