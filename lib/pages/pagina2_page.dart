import 'package:flutter/material.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pagina2")),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
              child: Text("Establecer Usuario",
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {}),
          SizedBox(height: 10),
          MaterialButton(
              child:
                  Text("Cambiar Edad", style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {}),
          SizedBox(height: 10),
          MaterialButton(
              child: Text("Añadir profesion",
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {}),
        ],
      )),
    );
  }
}
