import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gestionetudiant/etud/etudiant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class ListEtudiant extends StatelessWidget {
  // ListEtudiant({ Key? key }) : super(key: key);

  late Future<Etudiant> futureEtudiant;
  ListEtudiant(){
    // this.futureEtudiant = fetchEtudiant();
    getdata();
  }
  void getdata() async{
      Response response = await get(Uri.parse('http://127.0.0.1:8000/api/etudiant/'));
      List etudiant = jsonDecode(response.body);
      this.etudiants = etudiant;

      print(etudiants);
    }

  List etudiants = [
    {
      'prenom': 'Ahamada',
      'nom': 'Ibrahim',
      'datenaiss': '18/08/2005',
      'lieunaiss': 'Moroni',
      'sexe': 'M',
      'nationalite': 'comorienne',
    },
    {
      'prenom': 'salim',
      'nom': 'Saandati',
      'datenaiss': '18/08/2006',
      'lieunaiss': 'Moroni',
      'sexe': 'F',
      'nationalite': 'comorienne',
    },
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des étudiants'),
      ),
      body: Container(
        color: Colors.green,
        height: 300,
        padding: EdgeInsets.only(left: 50, right: 50),
        child: Column(
          children: etudiants.map((etudiant){
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MyText(etudiant['prenom']),
                MyText(etudiant['nom']),
                MyText(etudiant['datenaiss']),
                MyText(etudiant['lieunaiss']),
                MyText(etudiant['sexe']),
                MyText(etudiant['nationalite']),
              ],
            );
          }).toList()                      
        ),
      )
    );
  }
}

class MyText extends StatelessWidget {
  
  String texte;
  MyText(this.texte);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      child: Text(
        texte,
        style: GoogleFonts.nunito(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

