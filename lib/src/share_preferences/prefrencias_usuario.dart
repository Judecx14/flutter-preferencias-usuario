import 'package:preferencias_usuario/src/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia = PreferenciasUsuario._internal();
  factory PreferenciasUsuario() {
    return _instancia;
  }
  PreferenciasUsuario._internal();
  late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }
  //Ninguna de estas propiedades se usa
  /* bool? _colorSecundario;
  int? _genero;
  String? _nombre; */

  int get genero {
    return _prefs.getInt('genero') ?? 1;
  }

  set genero(int value) {
    _prefs.setInt('genero', value);
  }

  bool get colorSecundario {
    return _prefs.getBool('colorSecundario') ?? false;
  }

  set colorSecundario(bool value) {
    _prefs.setBool('colorSecundario', value);
  }

  String get nombre {
    return _prefs.getString('nombre') ?? 'Not Found';
  }

  set nombre(String value) {
    _prefs.setString('nombre', value);
  }

  String get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? HomePage.routeName;
  }

  set ultimaPagina(String value) {
    _prefs.setString('ultimaPagina', value);
  }
}
