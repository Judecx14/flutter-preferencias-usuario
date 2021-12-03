import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/share_preferences/prefrencias_usuario.dart';
import 'package:preferencias_usuario/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    final prefs = PreferenciasUsuario();
    //Aqui le indicamos que esta sera la ultima pagina
    prefs.ultimaPagina = routeName;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prefrencias de Usuario'),
        backgroundColor: prefs.colorSecundario ? Colors.teal : Colors.blue,
      ),
      drawer: const MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, //Horizontalmente en colm
        crossAxisAlignment:
            CrossAxisAlignment.center, //Verticalmente en columna
        children: [
          Text('Color Secundario: ${prefs.colorSecundario}'),
          const Divider(),
          Text('Genero: ${prefs.genero}'),
          const Divider(),
          Text('Nombre de usuario: ${prefs.nombre}'),
          const Divider(),
        ],
      ),
    );
  }
}
