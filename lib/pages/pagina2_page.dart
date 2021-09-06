import 'package:estado_singleton_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:estado_singleton_app/bloc/usuario/usuario_cubit.dart';

class Pagina2Page extends StatefulWidget {
  @override
  _Pagina2PageState createState() => _Pagina2PageState();
}

class _Pagina2PageState extends State<Pagina2Page> {
  @override
  Widget build(BuildContext context) {
    //Context.read es similar a Provider<>.of(context)
    final usuarioCubit = context.read<UsuarioCubit>();

    return Scaffold(
      appBar: AppBar(
        title: (usuarioCubit.state is UsuarioActivo)
            ? Text((usuarioCubit.state as UsuarioActivo).usuario.nombre)
            : Text("Pagina22"),
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
              final newUser = new Usuario(
                  nombre: "Fernando",
                  edad: 45,
                  profesiones: ["FullStack dev", "Gamer"]);

              usuarioCubit.seleccionarUsuario(newUser);

              setState(() {});
            },
          ),
          SizedBox(height: 10),
          MaterialButton(
            child: Text("Cambiar Edad", style: TextStyle(color: Colors.white)),
            color: Colors.blue,
            onPressed: () {
              usuarioCubit.cambiarEdad(32);
            },
          ),
          SizedBox(height: 10),
          MaterialButton(
            child:
                Text("Añadir profesion", style: TextStyle(color: Colors.white)),
            color: Colors.blue,
            onPressed: () {
              usuarioCubit.agregarProfesion("Contador");
            },
          ),
        ],
      )),
    );
  }
}
