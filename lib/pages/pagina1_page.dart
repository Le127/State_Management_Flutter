import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:estado_singleton_app/models/usuario.dart';
import 'package:estado_singleton_app/controllers/usuario_controller.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioCtrl = Get.put(UsuarioController());

    return Scaffold(
      appBar: AppBar(title: Text("Pagina1")),
      body: Obx(
        () => usuarioCtrl.existeUsuario.isTrue
            ? InformacionUsuario(usuario: usuarioCtrl.usuario.value)
            : NoInfoUsuario(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () => Get.toNamed('/pagina2',
            arguments: {"nombre": "Fernando", "edad": 35}),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;

  const InformacionUsuario({Key? key, required this.usuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("General",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ListTile(title: Text("Nombre: ${this.usuario.nombre} ")),
          ListTile(title: Text("Edad: ${this.usuario.edad}")),
          Text("Profesiones",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          SingleChildScrollView(
            child: Container(
              height: 300,
              width: 300,
              child: ListView.builder(
                itemCount: this.usuario.profesiones.length,
                itemBuilder: (_, index) => ListTile(
                    title: Text(
                        "Profesion ${index + 1}: ${this.usuario.profesiones[index]} ")),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class NoInfoUsuario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("No hay usuario seleccionado"),
      ),
    );
  }
}
