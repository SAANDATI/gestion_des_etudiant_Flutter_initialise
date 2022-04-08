import 'package:flutter/material.dart';
import 'package:gestionetudiant/classe/addClass.dart';
import 'package:gestionetudiant/etud/addStudent.dart';
import 'package:gestionetudiant/etud/listStudent.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:{
        '/':(context) => Accueil(),
        'add/etudiant':(context) => AddStudent()
      },
      title: 'Gestion etudiant',
      theme: ThemeData(
      primarySwatch: Colors.blue,
      ),
      // home: Accueil(),
    );
  }
}

class Accueil extends StatefulWidget {
  const Accueil({ Key? key }) : super(key: key);

  @override
  _AccueilState createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion des etudiants'),
      ),
      drawer: sidebar(),
      body: dashboard(),
    );
  }

  Widget sidebar(){
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text('Liste des étudiants'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const ListeEtudiant()));
            },
          ),
          ListTile(
            title: Text('Ajout etudiant'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddStudent()));
            },
          ),
          ListTile(
            title: Text('Ajout classe'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddClass()));
            },
          )
        ],
      ),
    );
  }
  Widget dashboard(){
    return Center(
      child: ListView(
        children:[
          TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.red), fixedSize: MaterialStateProperty.all(Size.infinite)
        ),
        onPressed: (){},
        child: Text('Ajouter un etudiant', 
              style: TextStyle(fontSize: 28, color: Colors.white),),       
      ),
      
      TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 27, 3, 133)),
        ),
        onPressed: (){},
        child: Text('Ajouter une classe', style: TextStyle(fontSize: 28, color: Colors.white))
      ),

      TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 95, 248, 100),
          ),
        ),
        onPressed: (){},
        child: Text('Liste des etudiants',style: TextStyle(fontSize: 28, color: Colors.black))
      )
        ],
      )
      );
  }
}



