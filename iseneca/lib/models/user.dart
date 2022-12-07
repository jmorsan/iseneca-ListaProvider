// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

import 'dart:convert';

class User {
    User({
        required this.id,
        required this.usuario,
        required this.clave,
        required this.nombreCompleto,
        required this.telefono,
        required this.mail, 
        required this.instituto,
    });

    String id;
    String usuario;
    String clave;
    String nombreCompleto;
    String telefono;
    String mail;
    String instituto;

    factory User.fromJson(String str) => User.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        usuario: json["usuario"],
        clave: json["clave"],
        nombreCompleto: json["nombre_completo"],
        telefono: json["telefono"],
        mail: json["mail"],
        instituto: json["instituto"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "usuario": usuario,
        "clave": clave,
        "nombre_completo": nombreCompleto,
        "telefono": telefono,
        "mail": mail,
    };
}
