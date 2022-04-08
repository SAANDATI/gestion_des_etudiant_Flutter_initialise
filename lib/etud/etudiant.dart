import 'dart:convert';
import 'package:http/http.dart' as http;

class Etudiant{
  int id;
  String prenom;
  String nom;
  String datenaiss;
  String lieu;
  String sexe;
  String nationalite;

  Etudiant( {
    required this.id, 
    required this.prenom, 
    required this.nom, 
    required this.datenaiss, 
    required this.lieu, 
    required this.sexe, 
    required this.nationalite
  }
  );

  factory Etudiant.fromJson(Map<String, dynamic> json) {
    return Etudiant(
      id: json['id'],
      prenom: json['prenom'],
      nom: json['nom'],
      datenaiss: json['dateNaissance'],
      lieu: json['lieuNaissance'],
      sexe: json['sexe'],
      nationalite: json['nationalite'],
    );
  }
}

Future<Etudiant> fetchEtudiant() async {
  final response = await http
      .get(Uri.parse('http://127.0.0.1:8000/api/etudiant/2'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Etudiant.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load etudiant');
  }
}
