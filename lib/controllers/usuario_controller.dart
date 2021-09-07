import 'package:get/get.dart';
import 'package:estado_singleton_app/models/usuario.dart';

class UsuarioController extends GetxController {
  var existeUsuario = false.obs;
  var usuario = new Usuario().obs;

  void cargarUsuario(Usuario pUsuario) {
    this.existeUsuario.value = true;
    this.usuario.value = pUsuario;
  }

  void cambiarEdad(int edad) {
    this.usuario.update((Usuario? usuario) {
      usuario!.edad = edad;
    });
  }
}
