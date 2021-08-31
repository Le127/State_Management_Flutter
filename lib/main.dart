import 'package:estado_singleton_app/services/usuarios_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:estado_singleton_app/pages/pagina2_page.dart';
import 'package:estado_singleton_app/pages/pagina1_page.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UsuarioService()),
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: "pagina1",
        routes: {
          "pagina1": (_) => Pagina1Page(),
          "pagina2": (_) => Pagina2Page(),
        });
  }
}
