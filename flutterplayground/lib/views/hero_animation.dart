import 'package:flutter/material.dart';

class HeroAnimationView extends StatefulWidget {
  const HeroAnimationView({super.key});

  @override
  State<HeroAnimationView> createState() => _HeroAnimationViewState();
}

@immutable
class Person {
  final String name;
  final String age;
  final String emoji;

  const Person({
    required this.name,
    required this.age,
    required this.emoji,
  });
}

const people = [
  Person(name: 'John', age: '25', emoji: '👨‍🦱'),
  Person(name: 'Jane', age: '22', emoji: '👩‍🦰'),
  Person(name: 'Jack', age: '30', emoji: '👨‍🦳'),
  Person(name: 'Jill', age: '28', emoji: '👩‍🦱'),
];

class _HeroAnimationViewState extends State<HeroAnimationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero Animation'),
      ),
      body: ListView.builder(
        itemCount: people.length,
        itemBuilder: (context, index) {
          final person = people[index];
          return ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => DetailsPage(
                          person: person,
                        )),
              );
            },
            leading: Text(
              person.emoji,
              style: const TextStyle(
                fontSize: 40,
              ),
            ),
            title: Text(person.name),
            subtitle: Text(
              '${person.age} years old',
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
          );
        },
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final Person person;

  const DetailsPage({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          person.emoji,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              person.name,
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              '${person.age} years old',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
