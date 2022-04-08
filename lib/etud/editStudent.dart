import 'package:flutter/material.dart';
import 'package:gestionetudiant/etud/addStudent.dart';

class EditStudent extends StatelessWidget {
  const EditStudent({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajout etudiant'),
      ),
      body: Column(
        children: [
          Padding(padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 18),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              hintText: "Prenom de l'étudiant"
            ),
          ),
          ),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 18),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              hintText: "Nom de l'étudiant"
            ),
          ),
          ),

          // Padding(padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 18),
          // child: TextFormField(
          //   decoration: const InputDecoration(
          //     border: UnderlineInputBorder(),
          //     hintText: "Date de naissance"
          //   ),
          //   keyboardType: TextInputType.datetime,
          // ),
          // ),
          BasicDateField(),

          Padding(padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 18),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              hintText: "Lieu de naissance"
            ),
          ),
          ),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 18),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              hintText: "Sexe"
            ),
          ),
          ),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 14),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              hintText: "Nationalité"
            ),
          ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Submit'),
            ),
          )
        ],
        
        ), 
      );
  }
}