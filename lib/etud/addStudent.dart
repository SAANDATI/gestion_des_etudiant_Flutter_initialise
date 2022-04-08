import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class AddStudent extends StatelessWidget {
  const AddStudent({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajoutee etudiant'),
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
        ],),);
  }
}

class BasicDateField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Date de naissance (${format.pattern})'),
      DateTimeField(
        format: format,
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(1990),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
        },
      ),
    ]);
  }
}