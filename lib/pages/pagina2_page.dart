import 'package:flutter/material.dart';
import 'package:estado_singleton_app/services/usuario_service.dart';
import 'package:estado_singleton_app/models/usuario.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: usuarioService.usuarioStream,
          builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
            return snapshot.hasData
                ? Center(child: Text("Nombre: ${snapshot.data!.nombre}"))
                : Text("Pagina 2");
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
                child: Text("Establecer Usuario",
                    style: TextStyle(color: Colors.white)),
                color: Colors.blue,
                onPressed: () {
                  final nuevoUsuario = new Usuario(nombre: "Jose", edad: 20);

                  usuarioService.cargarUsuario(nuevoUsuario);
                }),
            SizedBox(height: 10),
            MaterialButton(
                child:
                    Text("Cambiar Edad", style: TextStyle(color: Colors.white)),
                color: Colors.blue,
                onPressed: () {
                  usuarioService.cambiarEdad(30);
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
