import 'package:flutter/material.dart';
import 'package:gestionetudiant/classe/addClass.dart';
import 'package:gestionetudiant/etud/addStudent.dart';
import 'package:gestionetudiant/etud/etudiant.dart';
import 'package:gestionetudiant/etud/listEtudiant.dart';
import 'package:gestionetudiant/etud/listStudent.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late Future<Etudiant> futureEtudiant;
  @override
  void initState(){
    super.initState();
    futureEtudiant = fetchEtudiant();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:{
        '/':(context) => Accueil(),
        'addStudent':(context) => AddStudent(),
        'listEtudiant':(context) => ListEtudiant()
      },
      initialRoute: '/',
      title: 'Gestion etudiant',
      theme: ThemeData(
      primarySwatch: Colors.blue,
      ),
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: const Text(''),
      //   ),
      // ),
      // body: Center(
      //   child: FutureBuilder<Etudiant>(
      //     future: futureEtudiant,
      //     builder: (context, snapshot) {
      //       if (snapshot.hasData) {
      //         return Text(snapshot.data! .prenom);
      //       } else if(snapshot.hasError){
      //         return Text('${snapshot.error}');
      //       }
      //       return const CircularProgressIndicator();
      //     },
      //   ),
      // )
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
            title: const Text('Liste des étudiants'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ListeEtudiant()),);
            },
          ),
          ListTile(
            title: Text('Ajout etudiant'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddStudent()),);
            },
          ),
          ListTile(
            title: Text('Ajout classe'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddClass()),);
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
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
        onPressed: (){},
        child: Text('Ajouter un etudiant', 
              style: TextStyle(fontSize: 28, color: Colors.white),
              ),
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
class MyButton extends StatelessWidget {
  // const MyButton({ Key? key }) : super(key: key);
  String button;
  MyButton(this.button);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      child:Text(
        button,
        style: GoogleFonts.nunito(
          fontSize: 40,
          fontWeight: FontWeight.w800
        ),
      ),
    );
  }
}



