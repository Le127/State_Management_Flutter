import 'package:estado_singleton_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {
  //UusarioInitial() sera el estado inicial que tendra el cubit por defecto
  UsuarioCubit() : super(UsuarioInitial());

  void seleccionarUsuario(Usuario user) {
    emit(new UsuarioActivo(user));
  }

  void cambiarEdad(int edad) {
    //state es un get interno de UsuarioState
    final currentState = state;

    //Crea un nuevo estado con la edad  modificada utilizando copyWith
    if (currentState is UsuarioActivo) {
      final newUser = currentState.usuario.copyWith(edad: 50);
      emit(UsuarioActivo(newUser));
    }
  }

  void agregarProfesion(String profesion) {
    final currentState = state;

    if (currentState is UsuarioActivo) {
      final newProfesiones = [...currentState.usuario.profesiones, profesion];
      final newUser =
          currentState.usuario.copyWith(profesiones: newProfesiones);

      emit(UsuarioActivo(newUser));
    }
  }

  void borrarUsuario() {
    emit(UsuarioInitial());
  }
}
