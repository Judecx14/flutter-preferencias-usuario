import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/share_preferences/prefrencias_usuario.dart';
import 'package:preferencias_usuario/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static const String routeName = 'settings';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  //Estas propiedades se ponene afuera porque sino al colocarlar dentro del
  //build se crean cada vez que se redibujan entonces esto provoca que los
  //valores se pongan como fueron declarados
  late bool _colorSecundario;
  int? _genero;
  //Esta no se usa porque directamente lo pasamos al controller del
  //Input
  String? _nombre;

  final prefs = PreferenciasUsuario();
  //Sirve para indicar que más adelante tendrá un valor

  late final TextEditingController _textController =
      TextEditingController(text: prefs.nombre);
  //Se puede hacer así como en curso o de la manera de arriba
  //Se hacía porque nada más recive propiedades estaticas
  //Se dispara antes del build
  /*  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: _nombre);
  } */

  @override
  void initState() {
    super.initState();
    //Al incicio le decimos que sera la ultima pagina
    prefs.ultimaPagina = SettingsPage.routeName;
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    //cargarGenero();
  }

  //Creamos un metodo async aparte porque no podemos colocarl el async
  //En el init debido a que este no lo puede ser
  //Así de esta manera se cargan las preferencias colocando el setState
  /* cargarGenero() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _genero = prefs.getInt('genero') ?? 1;
    });
  } */

  /* _setSelectedRadio(int? valor) async {
    //Creamos la instnacia de sharedprefences con getInstance
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('genero', valor ?? 1);
    //Estos signos indican que si no tiene nada retornara un 1
    _genero = valor ?? 1;
    setState(() {});
  } */

  _setSelectedRadio(int? valor) {
    setState(() {
      prefs.genero = valor ?? 1;
      _genero = valor ?? 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajustes'),
        //backgroundColor: prefs.colorSecundario ? Colors.teal : Colors.blue,
        backgroundColor: _colorSecundario ? Colors.teal : Colors.blue,
      ),
      drawer: const MenuWidget(),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(5.0),
            child: const Text(
              'Settings',
              style: TextStyle(
                fontSize: 45.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(),
          SwitchListTile(
            value: _colorSecundario,
            title: const Text('Color secundario'),
            onChanged: (bool state) {
              setState(() {
                _colorSecundario = state;
                prefs.colorSecundario = state;
              });
            },
          ),
          RadioListTile(
            value: 1,
            title: const Text('Masculino'),
            groupValue: _genero,
            //No hace falta mandarle arguementos
            //Porque automaticamente lo pasa sin necesidad de
            //Especificarlo
            //Se pone sin los parentesis para dar la referencia del metodo
            //Pero no se manda nada
            onChanged: _setSelectedRadio,
          ),
          RadioListTile(
            value: 2,
            title: const Text('Femenino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),
          const Divider(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombte de la persona usando el smartphone',
              ),
              onChanged: (String value) {
                prefs.nombre = value;
              },
            ),
          ),
        ],
      ),
    );
  }
}
