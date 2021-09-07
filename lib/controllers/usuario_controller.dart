import 'package:get/get.dart';
import 'package:estado_singleton_app/models/usuario.dart';

class UsuarioController extends GetxController {
  var existeUsuario = false.obs;
  var usuario = new Usuario().obs;

  get profesionesCount {
    return this.usuario.value.profesiones.length;
  }

  void cargarUsuario(Usuario pUsuario) {
    this.existeUsuario.value = true;
    this.usuario.value = pUsuario;
  }

  void cambiarEdad(int edad) {
    this.usuario.update((Usuario? usuario) {
      usuario!.edad = edad;
    });
  }

  void agregarProfesion(String profesion) {
    this.usuario.update((Usuario? usuario) {
      usuario!.profesiones = [...usuario.profesiones, profesion];
    });
  }
}
