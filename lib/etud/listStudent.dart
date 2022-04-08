import 'package:flutter/material.dart';
import 'package:gestionetudiant/etud/editStudent.dart';
import 'package:gestionetudiant/etud/etudiant.dart';
import 'package:gestionetudiant/note/addnote.dart';
import 'dart:convert';

import 'package:http/http.dart';

class ListeEtudiant extends StatelessWidget {
  var etudiants;

  late Future<Etudiant> futureEtudiant;
  ListeEtudiant(){
    getdata();
  }
  void getdata() async{
    Response response = await get(Uri.parse('http://127.0.0.1:8000/api/etudiant/'));
    List etudiant = jsonDecode(response.body);
    // this._etudiants = etudiant;
    print(etudiants);
  }
  

  // List<Map> _etudiants = [
  //   {
  //     'id': '1',
  //     'prenom': 'Ahamada',
  //     'nom': 'Ibrahim',
  //     'datenaiss': '18/08/2005',
  //     'lieunaiss': 'Moroni',
  //     'sexe': 'M',
  //     'nationalite': 'comorienne',
  //   },
  //   {
  //     'prenom': 'salim',
  //     'nom': 'Saandati',
  //     'datenaiss': '18/08/2006',
  //     'lieunaiss': 'Moroni',
  //     'sexe': 'F',
  //     'nationalite': 'comorienne',
  //   },
  //   {
  //     'prenom': 'Absa',
  //     'nom': 'Fam',
  //     'datenaiss': '18/08/2008',
  //     'lieunaiss': 'Dakar',
  //     'sexe': 'F',
  //     'nationalite': 'Senegalaise',
  //   }
  // ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(  
      home: Scaffold(  
          appBar: AppBar(  
            title: Text('Gestion des etudiants'),  
          ),  
          // body: ListView(children: <Widget>[  
          //   Center(  
          //     child: Text(  
          //       'Liste des etudiants',  
          //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),  
          //     )),  
          //   DataTable(  
          //     columns: [  
          //       DataColumn(label: Text(  
          //           'ID',  
          //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)  
          //       )),  
          //       DataColumn(label: Text(  
          //           'Prenom',  
          //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)  
          //       )),  
          //       DataColumn(label: Text(
          //         'Nom',  
          //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)  
          //       )),
          //       DataColumn(label: Text(
          //         'Date naissance',
          //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
          //       )),  
          //       DataColumn(label: Text(  
          //           'Lieu naiss',  
          //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)  
          //       )),  
          //       DataColumn(label: Text(  
          //           'Sexe',  
          //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)  
          //       )),  
          //       DataColumn(label: Text(  
          //           'Nationalité',  
          //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)  
          //       )),
          //       DataColumn(label: Text(  
          //           'Actions',  
          //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)  
          //       ))  
          //     ],  
          //     rows: [  
          //       DataRow(cells: [  
          //         DataCell(Text('1')),  
          //         DataCell(Text('Stephen')),  
          //         DataCell(Text('Actor')),
          //         DataCell(Text('12/12/2001')),
          //         DataCell(Text('Dakar')), 
          //         DataCell(Text('Masculin')),
          //         DataCell(Text('Senegalaise')), 
          //         DataCell(
          //           TextButton(
          //           style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.amberAccent), 
          //           fixedSize: MaterialStateProperty.all(Size.infinite)),
          //           onPressed: (){},
          //           child: Text('Edit'),
          //           ),)
          //     ]),  
          //       DataRow(cells: [  
          //         DataCell(Text('1')),  
          //         DataCell(Text('Stephen')),  
          //         DataCell(Text('Actor')),
          //         DataCell(Text('12/12/2001')),
          //         DataCell(Text('Dakar')), 
          //         DataCell(Text('Masculin')),
          //         DataCell(Text('Senegalaise')), 
          //         DataCell(
          //           TextButton(
          //           style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.amberAccent), 
          //           fixedSize: MaterialStateProperty.all(Size.infinite)),
          //           onPressed: (){},
          //           child: Text('Edit'),
          //           ),
          //         ),
          //       ]),
          //       DataRow(cells: [  
          //         DataCell(Text('1')),  
          //         DataCell(Text('Stephen')),  
          //         DataCell(Text('Actor')),
          //         DataCell(Text('12/12/2001')),
          //         DataCell(Text('Dakar')), 
          //         DataCell(Text('Masculin')),
          //         DataCell(Text('Senegalaise')),
          //         DataCell(
          //           TextButton(
          //           style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white), 
          //           fixedSize: MaterialStateProperty.all(Size.zero)),
          //           onPressed: (){},
          //           child: Column(
          //             children: <Widget>[
          //               TextButton(
          //                 style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green), 
          //                 fixedSize: MaterialStateProperty.all(Size.zero)),
          //                 onPressed: (){}, 
          //                 child: Icon(Icons.edit)
          //               ),
          //               TextButton(
          //                 style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red), 
          //                 fixedSize: MaterialStateProperty.all(Size.zero)),
          //                 onPressed: (){}, 
          //                 child: Icon(Icons.delete)
          //               )
          //             ],
          //           )
          //           ),
          //         ), 
          //       ]),  
          //     ],  
          //   ),  
          // ]
          // )  
      
          body: ListView(
          children: [
            _createDataTable(context)
          ],
        ),
      ),  
    );  
  } 
  DataTable _createDataTable(BuildContext context){
  return DataTable(columns: _createColumns(), 
  rows: _createRows(context)
  );
}
List<DataColumn> _createColumns(){
  return [
    DataColumn(label: Text('ID')),
    DataColumn(label: Text('Prenom')),
    DataColumn(label: Text('Nom')),
    DataColumn(label: Text('Date Naiss')),
    DataColumn(label: Text('Lieu naiss')),
    DataColumn(label: Text('Sexe')),
    DataColumn(label: Text('Nationalité')),
    DataColumn(label: Text('Actions'))
  ];
}
List<DataRow> _createRows(BuildContext context){
  return etudiants
  .map((etudiant)=> DataRow(cells: [
      DataCell(Text('#'+ etudiant['id'].toString())),
      DataCell(Text(etudiant['prenom'])),
      DataCell(Text(etudiant['nom'])),
      DataCell(Text(etudiant['dateNaissance'])),
      DataCell(Text(etudiant['lieuNaissance'])),
      DataCell(Text(etudiant['sexe'])),
      DataCell(Text(etudiant['nationalite'])),
      DataCell(
        Row(
          children: [
            TextButton.icon(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const EditStudent()),);
              },
              icon: Text(''), label: Icon(Icons.edit_outlined)),
            
            TextButton.icon(
              onPressed: (){}, 
              icon: Text(''), label: Icon(Icons.delete)),
            
            TextButton.icon(
              // style: ButtonStyle(
              //   backgroundColor: MaterialStateProperty(color: Colors.blue)
              // ),
              onPressed: (){}, 
              icon: Text(''), label: Icon(Icons.list_alt_outlined)),
            TextButton.icon(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddNote()),);
              }, 
              icon: Text('Note'), label: Icon(Icons.add_circle))
          ],
        )
      ),
    ]))
    .toList();
}
}

