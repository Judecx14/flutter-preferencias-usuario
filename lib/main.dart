import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/pages/home_page.dart';
import 'package:preferencias_usuario/src/pages/settings_page.dart';
import 'package:preferencias_usuario/src/share_preferences/prefrencias_usuario.dart';

void main() async {
  //Esto se coloca para que no suceda el error cuando queremos cargar algo
  //Antes de la aplicación
  WidgetsFlutterBinding.ensureInitialized();
  //Esto se hace para inicializar la preferencias desde un principio
  //Para que no este nulas las preferencias
  //Tambien se hace para que cada vez que queremos usar los SharedPrerences
  //No tengasmos que esperar al await porque ya esta inicializado desde
  //Que inicia la app
  final prefs = PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prefs = PreferenciasUsuario();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferencias de Usuario',
      initialRoute: prefs.ultimaPagina,
      routes: {
        HomePage.routeName: (_) => HomePage(),
        SettingsPage.routeName: (_) => const SettingsPage(),
      },
    );
  }
}
