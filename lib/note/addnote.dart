import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';

class AddNote extends StatefulWidget {
  const AddNote({ Key? key }) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajout note etud'),
      ),
      body: Column(
        children: [
          // Padding(padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 18),
          // child: TextFormField(
          //   decoration: const InputDecoration(
          //     border: UnderlineInputBorder(),
          //     hintText: "Matière"
          //   ),
          // ),
          // ),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 18),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              hintText: "Note"
            ),
          ),
          ),
          SelectFormField(
            type: SelectFormFieldType.dropdown, // or can be dialog
            initialValue: 'circle',
            // icon: Icon(Icons.format_shapes),
            labelText: 'Matiere',
            items: _matieres,
            onChanged: (val) => print(val),
            onSaved: (val) => print(val),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Ajouter'),
            ),
          )
        ],
      ),


    
    );
  }

  final List<Map<String, dynamic>> _matieres = [
  {
    'value': 'Iot',
    'label': 'Internet of thing',
    // 'icon': Icon(Icons.stop),
  },
  {
    'value': 'java',
    'label': 'Java EE',
    // 'icon': Icon(Icons.fiber_manual_record),
    // 'textStyle': TextStyle(color: Colors.red),
  },
  {
    'value': 'Dev Mobil',
    'label': 'Laravel',
    'enable': false,
    // 'icon': Icon(Icons.grade),
  },
];

}