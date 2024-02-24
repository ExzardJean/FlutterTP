import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Map<String, dynamic>> people = [
    {
      'nom': 'Exzard',
      'prenom': 'Jean Abellard',
      'email': 'jeanexzard6@gmail.com',
      'Universite': ['Ecole Superieure Infotronique Haiti (ESIH)'],
      'Specialisation': ['Informatique'],
    },
    {
      'nom': 'Emmanuel ',
      'prenom': 'Steeve',
      'email': ' steeveemmanuel8@gmail.com',
      'Universite': ['Ecole Superieure Infotronique Haiti (ESIH)'],
      'Specialisation': ['Informatique'],
    },
    {
      'nom': 'Louis ',
      'prenom': 'Stanley',
      'email': 'louisstanley@gmail.com',
      'Universite': ['Ecole Superieure Infotronique Haiti (ESIH)'],
      'Specialisation': ['Informatique'],
    },
    {
      'nom': 'Ovide ',
      'prenom': 'Samuel',
      'email': 'ovidesamuel@gmail.com',
      'Universite': ['Ecole Superieure Infotronique Haiti (ESIH)'],
      'Specialisation': ['Informatique'],
    },
    {
      'nom': 'Plonquette ',
      'prenom': 'Watcherley',
      'email': 'watcherleyplonquette@gmail.com',
      'Universite': ['Ecole Superieure Infotronique Haiti (ESIH)'],
      'Specialisation': ['Informatique'],
    },
    {
      'nom': 'Bryan ',
      'prenom': 'Nicaisse',
      'email': 'nicaissebryan@gmail.com',
      'Universite': ['Ecole Superieure Infotronique Haiti (ESIH)'],
      'Specialisation': ['Informatique'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Information sur les membres',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'les membres du Groupe',
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: ListView.builder(
          itemCount: people.length,
          itemBuilder: (context, index) {
            final person = people[index];
            return ListTile(
              title: Text(
                '${person['nom']} ${person['prenom']}',
                style: TextStyle(fontSize: 18.0), 
              ),
              
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Personplus(person: person),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class Personplus extends StatelessWidget {
  final Map<String, dynamic> person;

  Personplus({required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${person['nom']} ${person['prenom']}'),
        centerTitle: true,
          backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => personalinformation(person: person),
                  ),
                );
              },
              child: Text('personal Information'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20.0),
                textStyle: TextStyle(fontSize: 18.0),
                backgroundColor: Colors.blue,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => academicbackground(person: person),
                  ),
                );
              },
              child: Text('Academic Background'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20.0),
                textStyle: TextStyle(fontSize: 18.0),
          backgroundColor: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class personalinformation extends StatelessWidget {
  final Map<String, dynamic> person;

  personalinformation({required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('personal Information'),
         centerTitle: true,
          backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                'Nom: ${person['nom']}',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            ListTile(
              title: Text(
                'Prenom: ${person['prenom']}',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            ListTile(
              title: Text(
                'Email: ${person['email']}',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class academicbackground extends StatelessWidget {
  final Map<String, dynamic> person;

  academicbackground({required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Academic Background'),
         centerTitle: true,
          backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...List.generate(
              person['Universite'].length,
              (index) => ListTile(
                title: Text(
                  'Universite: ${person['Universite'][index]}',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            ...List.generate(
              person['Specialisation'].length,
              (index) => ListTile(
                title: Text(
                  'Specialisation: ${person['Specialisation'][index]}',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
