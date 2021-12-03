import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/pages/home_page.dart';
import 'package:preferencias_usuario/src/pages/settings_page.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero, //Eliminamos todo el padding
        children: [
          DrawerHeader(
            child: Container(), //Podemos poner más cosas, cuz is required
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/menu-img.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.pages,
              color: Colors.blue,
            ),
            title: const Text('Pages'),
            onTap: () {
              Navigator.pushReplacementNamed(context, HomePage.routeName);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.party_mode,
              color: Colors.blue,
            ),
            title: const Text('Party mode'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.people,
              color: Colors.blue,
            ),
            title: const Text('People'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: Colors.blue,
            ),
            title: const Text('Ajustes'),
            onTap: () {
              /* Navigator.pop(context);//Cerrar Drawer
              Navigator.pushNamed(context, SettingsPage.routeName); */
              //Las demas rutas desapareceran de la raíz con ese metodo
              Navigator.pushReplacementNamed(context, SettingsPage.routeName);
            },
          ),
        ],
      ),
    );
  }
}
