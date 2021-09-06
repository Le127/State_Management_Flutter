part of "usuario_bloc.dart";

@immutable
abstract class UsuarioEvent {}

//Eventos
class ActivarUsuario extends UsuarioEvent {
  final Usuario usuario;

  ActivarUsuario(this.usuario);
}

class CambiarEdad extends UsuarioEvent {
  final int newEdad;

  CambiarEdad(this.newEdad);
}

class AgregarProfesion extends UsuarioEvent {
  final String newProfesion;

  AgregarProfesion(this.newProfesion);
}

class EliminarUsuario extends UsuarioEvent {
  EliminarUsuario();
}
