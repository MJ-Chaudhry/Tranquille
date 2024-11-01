import 'package:flutter/material.dart';
import 'package:tranquille/home.dart';
import 'package:tranquille/music.dart';
import 'package:tranquille/notes.dart';
import 'package:tranquille/resources.dart';
import 'package:tranquille/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      themeMode: ThemeMode.light,
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
    const Music(),
    const Resources(),
    const NotesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: NavigationBar(
          height: 64,
          indicatorColor: Theme.of(context).colorScheme.secondary,
          backgroundColor: Theme.of(context).colorScheme.surface,
          selectedIndex: pageIndex,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          onDestinationSelected: (value) => setState(() {
            pageIndex = value;
          }),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(icon: Icon(Icons.music_note), label: "Music"),
            NavigationDestination(
                icon: Icon(Icons.interests_outlined), label: "Resources"),
            NavigationDestination(icon: Icon(Icons.note), label: "Notes"),
          ],
        ),
        body: pages[pageIndex],
      ),
    );
  }
}
