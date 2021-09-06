import 'package:estado_singleton_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:estado_singleton_app/bloc/usuario/usuario_cubit.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagina1"),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              //Accedemos al Cubit
              context.read<UsuarioCubit>().borrarUsuario();
            },
          )
        ],
      ),
      body: BlocBuilder<UsuarioCubit, UsuarioState>(
        builder: (_, state) {
          switch (state.runtimeType) {
            case UsuarioInitial:
              return Center(child: Text("No hay informacion del usuario"));
            case UsuarioActivo:
              return InformacionUsuario((state as UsuarioActivo).usuario);
            default:
              return Center(
                child: Text("Estado no reconocido"),
              );
          }
        },
      ),
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
            height: 300,
            width: 300,
            child: ListView.builder(
              itemCount: usuario.profesiones.length,
              itemBuilder: (_, int index) {
                return ListTile(
                  title:
                      Text("Profesión $index : ${usuario.profesiones[index]}"),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
