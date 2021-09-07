import 'package:estado_singleton_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:estado_singleton_app/controllers/usuario_controller.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //print(Get.arguments["nombre"]);
    //Obtiene la informacion de UsuarioController, similar a provider.of<>(context)
    final usuarioCtrl = Get.find<UsuarioController>();

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
                onPressed: () {
                  usuarioCtrl.cargarUsuario(
                    Usuario(
                        nombre: "Fernando", edad: 35, profesiones: ["Gamer"]),
                  );
                }),
            SizedBox(height: 10),
            MaterialButton(
                child:
                    Text("Cambiar Edad", style: TextStyle(color: Colors.white)),
                color: Colors.blue,
                onPressed: () {
                  usuarioCtrl.cambiarEdad(25);
                }),
            SizedBox(height: 10),
            MaterialButton(
                child: Text("Añadir profesion",
                    style: TextStyle(color: Colors.white)),
                color: Colors.blue,
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
