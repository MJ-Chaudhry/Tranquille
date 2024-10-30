import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Tranquille",
              style: TextStyle(fontSize: 32),
            ),
            Container(
              // color: const Color.fromARGB(255, 42, 143, 224),
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.only(bottom: 10.0),
              child: const Text(
                "Welcome to our app",
                style: TextStyle(
                  // color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
            Container(
              // color: const Color.fromARGB(255, 42, 143, 224),
              padding:
                  const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
              margin: const EdgeInsets.only(bottom: 10.0),
              child: const Text(
                "It's okay to take a break and prioritize your mental health",
                style: TextStyle(
                  // color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
            Container(
              // color: const Color.fromARGB(255, 42, 143, 224),
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.only(bottom: 10.0),
              child: const Text(
                "How are you feeling today?",
                style: TextStyle(
                  // color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
            Container(
              // color: const Color.fromARGB(255, 42, 143, 224),
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      print('Yaaaaayyyy!');
                    },
                    child: const Text('Happy'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      print('Daaammmmnnn!');
                    },
                    child: const Text('Sad'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      print('Oooooppps!');
                    },
                    child: const Text('Anxious'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
