import 'package:flutter/material.dart';

import "dart:async";

import 'package:bloc/bloc.dart';
import 'package:estado_singleton_app/models/usuario.dart';

part 'usuario_state.dart';
part 'usuario_event.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  UsuarioBloc() : super(UsuarioState());

  //Recibe un evento y cambia el estado
  @override
  Stream<UsuarioState> mapEventToState(UsuarioEvent event) async* {
    if (event is ActivarUsuario) {
      yield state.copyWith(usuario: event.usuario);
    } else if (event is CambiarEdad) {
      yield state.copyWith(
          usuario: state.usuario!.copyWith(edad: event.newEdad));
    } else if (event is AgregarProfesion) {
      yield state.copyWith(
        usuario: state.usuario!.copyWith(
            profesiones: [...state.usuario!.profesiones, event.newProfesion]),
      );
    } else if (event is EliminarUsuario) {
      yield state.estadoInicial();
    }
  }
}
