import 'package:flutter/material.dart';
import 'package:tranquille/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Tranquille(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Tranquille extends StatefulWidget {
  const Tranquille({super.key});

  @override
  State<Tranquille> createState() => _TranquilleState();
}

class _TranquilleState extends State<Tranquille> {
  int pageIndex = 0; // Current page selected.

  List<Widget> pages = [
    const Home(),
    Container(
      color: Colors.blue,
    ), // Music()
    Container(
      color: Colors.orange,
    ),
    Container(
      color: Colors.grey,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.amber,
          unselectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.music_note), label: "Music"),
            BottomNavigationBarItem(
                icon: Icon(Icons.interests_outlined), label: "Resources"),
            BottomNavigationBarItem(icon: Icon(Icons.note), label: "Notes"),
          ],
          currentIndex: pageIndex,
          onTap: (value) => setState(() {
            pageIndex = value;
          }),
        ),
        body: pages[pageIndex],
      ),
    );
  }
}
