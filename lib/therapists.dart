
// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Therapists {
  final String name;
  final String email;
  final String location;

  Therapists({required this.name, required this.email, required this.location});  
}

  

class TherapistListScreen extends StatelessWidget {
final List<Therapists> therapists = [ 
    Therapists(name: 'Ms. Kawira Mukuru', email: 'kawira.mukuru@gmail.com' , location: 'Nairobi, Kenya'),
    Therapists(name: 'Hariet Maina', email: 'Hariet.maina@gmail.com' , location: 'Nairobi, Kenya'),
    Therapists(name: 'Mr. Tobias Jan', email: 'Tobias.jan@gmail.com' , location: 'Upperhill, Nairobi'),
    Therapists(name: 'Mr. Simeon Mainye', email:'Simeon.mainye@gmail,com' , location: 'Nairobi, Kenya'),
    Therapists(name: 'Mr. Husein Allibihai', email:'Husein.allibihai@gmail,com' , location: 'Gigiri, Nairobi'),


  ];
  // This widget is the root of your application.
  @override
    Widget build(BuildContext context) {
    return MaterialApp(  
       debugShowCheckedModeBanner: false,
     home:Scaffold(
        backgroundColor:  Colors.white,
      appBar: AppBar(
        title: const Text("Tranquille"),centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: therapists.length,
        itemBuilder: (context, index) {
          final therapist = therapists[index];
         return Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: ListTile(
                contentPadding: EdgeInsets.all(15),
                leading: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  child: Text(therapist.name[0]),
                ),
                title: Text(
                  therapist.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text(therapist.email),
                    SizedBox(height: 5),
                    Text(therapist.location),
                  ],
                ),
                isThreeLine: true,
              ),
            );
        },
      ),
      // 
    
     ) );
    }
    }