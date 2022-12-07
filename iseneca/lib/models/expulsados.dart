// To parse this JSON data, do
//
//     final expulsados = expulsadosFromMap(jsonString);

import 'dart:convert';

class Expulsados {
    Expulsados({
        required this.alumno,
        required this.curso,
        required this.fechaInicio,
        required this.fechaFin,
    });

    String alumno;
    String curso;
    String fechaInicio;
    String fechaFin;

    factory Expulsados.fromJson(String str) => Expulsados.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Expulsados.fromMap(Map<String, dynamic> json) => Expulsados(
        alumno: json["Alumno"],
        curso: json["Curso"],
        fechaInicio: json["Fecha_Inicio"],
        fechaFin: json["Fecha_Fin"],
    );

    Map<String, dynamic> toMap() => {
        "Alumno": alumno,
        "Curso": curso,
        "Fecha_Inicio": fechaInicio,
        "Fecha_Fin": fechaFin,
    };
}
