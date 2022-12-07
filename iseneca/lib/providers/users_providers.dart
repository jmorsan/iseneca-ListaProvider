import 'dart:convert';

import 'package:iseneca/models/convivencia.dart';
import 'package:iseneca/models/expulsados.dart';
import 'package:iseneca/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UsersProvider extends ChangeNotifier {
  List<User> usersList = [];
  List<Convivencia> convicenciaList = [];
  List<Expulsados> expulsadosList = [];

  UsersProvider() {
    _getUsuariosJsonData();
    _getConvivenciaJsonData();
    _getExpulsadosJsonData();
  }

  Future<List<User>> _getUsuariosJsonData() async {
    var url = Uri.parse(
        'https://script.google.com/macros/s/AKfycbyaPGHuEiF44vS-ql_RY7MbNVMDFRgwnvRjTu-aY4AhVhstT2CxMb7h3Z3Ljo8BAGhk/exec?spreadsheetId=1yF7DcKywQ3iGa37RoV47WJGLhoTjezQD8H3fjcoHUKo&sheet=usuarios');

    // Await the http get response, then decode the json-formatted response.
    final data = await http.get(url);
    dynamic jsonAppData = jsonDecode(data.body);

    for (dynamic json in jsonAppData) {
      User user = User(
        id: json["id"],
        usuario: json["usuario"],
        clave: json["clave"],
        nombreCompleto: json["nombre_completo"],
        telefono: json["telefono"],
        mail: json["mail"],
        instituto: json["instituto"],
      );
      usersList.add(user);
    }
    //print(user);
    return usersList;
  }

  Future<List<Convivencia>> _getConvivenciaJsonData() async {
    var url = Uri.parse(
        'https://script.google.com/macros/s/AKfycbyaPGHuEiF44vS-ql_RY7MbNVMDFRgwnvRjTu-aY4AhVhstT2CxMb7h3Z3Ljo8BAGhk/exec?spreadsheetId=1yF7DcKywQ3iGa37RoV47WJGLhoTjezQD8H3fjcoHUKo&sheet=convivencia');

    // Await the http get response, then decode the json-formatted response.
    final data = await http.get(url);
    dynamic jsonAppData = jsonDecode(data.body);

    for (dynamic json in jsonAppData) {
      Convivencia user = Convivencia(
        alumno: json["Alumno"],
        curso: json["Curso"],
        fechaInicio: json["Fecha_Inicio"],
        fechaFin: json["Fecha_Fin"],
      );
      convicenciaList.add(user);
    }
    //print(user);
    return convicenciaList;
  }

  Future<List<Expulsados>> _getExpulsadosJsonData() async {
    var url = Uri.parse(
        'https://script.google.com/macros/s/AKfycbyaPGHuEiF44vS-ql_RY7MbNVMDFRgwnvRjTu-aY4AhVhstT2CxMb7h3Z3Ljo8BAGhk/exec?spreadsheetId=1yF7DcKywQ3iGa37RoV47WJGLhoTjezQD8H3fjcoHUKo&sheet=expulsados');

    // Await the http get response, then decode the json-formatted response.
    final data = await http.get(url);
    dynamic jsonAppData = jsonDecode(data.body);

    for (dynamic json in jsonAppData) {
      Expulsados user = Expulsados(
        alumno: json["Alumno"],
        curso: json["Curso"],
        fechaInicio: json["Fecha_Inicio"],
        fechaFin: json["Fecha_Fin"],
      );
      expulsadosList.add(user);
    }
    //print(user);
    return expulsadosList;
  }
}
