import 'package:estado_singleton_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:estado_singleton_app/services/usuarios_services.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Pagina1"),
        actions: [
          IconButton(
            onPressed: () {
              usuarioService.removerUsuario();
            },
            icon: Icon(Icons.delete),
          )
        ],
      ),
      body: usuarioService.existeUsuario
          ? InformacionUsuario(usuarioService.usuario!)
          : Center(child: Text("No hay usuario seleccionado")),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, "pagina2"),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;

  const InformacionUsuario(this.usuario);
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
          ListTile(title: Text("Nombre: ${usuario.nombre} ")),
          ListTile(title: Text("Edad: ${usuario.edad}")),
          Text("Profesiones",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          Container(
            height: 400,
            width: 400,
            child: ListView.builder(
                itemCount: usuario.profesiones!.length,
                itemBuilder: (_, index) => ListTile(
                    title: Text(
                        "Profesion ${index + 1}: ${usuario.profesiones![index]} "))),
          )
          /*      ListTile(title: Text("Profesion 1: ")),
          ListTile(title: Text("Profesion 1: ")),
          ListTile(title: Text("Profesion 1: ")), */
        ],
      ),
    );
  }
}
