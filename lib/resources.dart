import 'package:flutter/material.dart';
import 'dart:math';

class Resources extends StatefulWidget {
  const Resources({super.key});

  @override
  State<Resources> createState() => _ResourcesState();
}

class _ResourcesState extends State<Resources> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const ResourcePage(), // Books page
    const TherapistsPage(), // Placeholder for therapists page
  ];

  void _onNavigationRailTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SafeArea(
            child: NavigationRail(
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.book),
                  label: Text('Books'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.person_3_outlined),
                  label: Text('Therapists'),
                ),
              ],
              labelType: NavigationRailLabelType.none,
              selectedIndex: _selectedIndex,
              onDestinationSelected: _onNavigationRailTap,
            ),
          ),
          Expanded(child: _pages[_selectedIndex]),
        ],
      ),
    );
  }
}

class ResourcePage extends StatefulWidget {
  const ResourcePage({super.key});

  @override
  State<ResourcePage> createState() => _ResourcePageState();
}

class _ResourcePageState extends State<ResourcePage> {
  final List<String> quotes = [
    "Feel the fear and do it anyway.",
    "Stop overthinking, start living.",
    "Every day is a new beginning.",
    "You are stronger than you think."
  ];

  @override
  Widget build(BuildContext context) {
    final randomQuote = quotes[Random().nextInt(quotes.length)];

    return Scaffold(
      appBar: AppBar(title: const Text('Tranquille')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(randomQuote,
                style:
                    const TextStyle(fontSize: 24, fontStyle: FontStyle.italic)),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                  labelText: 'Search for a book', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: () {}, child: const Text('Search')),
            const SizedBox(height: 20),
            const Text('Recommended Books:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  BookCard(
                      imagePath: 'assets/images/fear.jpeg',
                      bookName: 'Feel the Fear and Do It Anyway',
                      authorName: 'Susan Jeffers',
                      rating: 4.5),
                  SizedBox(width: 10),
                  BookCard(
                      imagePath: 'assets/images/stop.jpeg',
                      bookName: 'Stop Overthinking',
                      authorName: 'Nick Trenton',
                      rating: 4.0),
                  SizedBox(width: 10),
                  BookCard(
                      imagePath: 'assets/images/trauma.jpeg',
                      bookName: 'Healing Childhood Trauma',
                      authorName: 'Robin Marvel',
                      rating: 4.8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TherapistsPage extends StatelessWidget {
  const TherapistsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Therapists Page', style: TextStyle(fontSize: 24)),
    );
  }
}

class BookCard extends StatelessWidget {
  final String imagePath;
  final String bookName;
  final String authorName;
  final double rating;

  const BookCard(
      {super.key,
      required this.imagePath,
      required this.bookName,
      required this.authorName,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Image.asset(imagePath, width: 100, height: 150),
        // const SizedBox(height: 5),
        Text(bookName, textAlign: TextAlign.center),
        Text(authorName, textAlign: TextAlign.center),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return Icon(index < rating.round() ? Icons.star : Icons.star_border,
                color: Colors.amber, size: 16);
          }),
        ),
      ],
    );
  }
}
