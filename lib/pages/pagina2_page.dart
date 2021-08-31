import 'package:estado_singleton_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:estado_singleton_app/services/usuarios_services.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
      appBar: AppBar(
        title: usuarioService.existeUsuario
            ? Text("${usuarioService.usuario!.nombre}")
            : Text("Pagina2"),
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
                  final newUser = Usuario(
                      nombre: "Fernando",
                      edad: 40,
                      profesiones: ["FullStack Dev", "Gamer", "Pilot"]);
                  usuarioService.usuario = newUser;
                }),
            //
            SizedBox(height: 10),
            //
            MaterialButton(
              child:
                  Text("Cambiar Edad", style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                usuarioService.existeUsuario
                    ? usuarioService.cambiarEdad(50)
                    : print("No hay usuario creado");
              },
            ),
            //
            SizedBox(height: 10),
            //
            MaterialButton(
              child: Text("Añadir profesion",
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                usuarioService.existeUsuario
                    ? usuarioService.agregarProfesion("peluquero")
                    : print("No hay usuario creado");
              },
            ),
          ],
        ),
      ),
    );
  }
}
