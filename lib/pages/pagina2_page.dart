import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:estado_singleton_app/bloc/usuario/usuario_bloc.dart';
import 'package:estado_singleton_app/models/usuario.dart';

class Pagina2Page extends StatefulWidget {
  @override
  _Pagina2PageState createState() => _Pagina2PageState();
}

class _Pagina2PageState extends State<Pagina2Page> {
  @override
  Widget build(BuildContext context) {
    final usuarioBloc = BlocProvider.of<UsuarioBloc>(context);
    return Scaffold(
      appBar: AppBar(
          title: usuarioBloc.state.existeUsuario
              ? Text(usuarioBloc.state.usuario!.nombre)
              : Text("Pagina2")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //
            MaterialButton(
              child: Text("Establecer Usuario",
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                final newUser = new Usuario(
                    edad: 34,
                    nombre: 'Fernando',
                    profesiones: ["FullStack Dev"]);

                usuarioBloc.add(ActivarUsuario(newUser));

                setState(() {});
              },
            ),

            SizedBox(height: 10),
            //
            //
            MaterialButton(
              child:
                  Text("Cambiar Edad", style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                usuarioBloc.add(CambiarEdad(45));
              },
            ),
            SizedBox(height: 10),
            //
            //
            MaterialButton(
              child: Text("Añadir profesion",
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                usuarioBloc.add(AgregarProfesion("Gamer"));
              },
            ),
          ],
        ),
      ),
    );
  }
}
