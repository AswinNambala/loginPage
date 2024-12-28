import 'package:flutter/material.dart';
import 'package:login_page/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> people = [
    {'name': 'Aswin', 'image': 'assets/dowload(4).jpg'},
    {'name': 'Sudhev', 'image': 'assets/download (1).jpg'},
    {'name': 'Aswin s Kumar', 'image': 'assets/download (2).jpg'},
    {'name': 'Alex', 'image': 'assets/download.jpg'},
    {'name': 'Neha', 'image': 'assets/images (1).jpg'},
    {'name': 'Iron', 'image': 'assets/images (2).jpg'},
    {'name': 'Sabith', 'image': 'assets/images (3).jpg'},
    {'name': 'Sneha', 'image': 'assets/download (3).jpg'},
    {'name': 'Niya', 'image': 'assets/images (5).jpg'},
    {'name': 'Hari', 'image': 'assets/images (4).jpg'},
    {'name': 'Sreehari', 'image': 'assets/images (8).jpg'},
    {'name': 'Yadhu', 'image': 'assets/images (6).jpg'},
    {'name': 'Anaju', 'image': 'assets/images (7).jpg'}
  ];
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow[400],
          title: const Text('HOME PAGE'),
          actions: [
            const Text("Sing Out"),
            IconButton(
                onPressed: () {
                  singOut(context);
                },
                icon: const Icon(Icons.exit_to_app)),
          ],
        ),
        body: ListView.separated(
            itemCount: people.length,
            separatorBuilder: (context, index) {
              return Divider(
                color: Colors.amberAccent[100],
              );
            },
            itemBuilder: (context, index) {
              final person = people[index];
              return ListTile(
                title: Text(person['name']!),
                subtitle: const Text('You have a message'),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(index % 2 == 0 ? 50 : 0),
                  child: Image.asset(
                    person['image']!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                trailing: const Text('2:00 PM'),
              );
            }));
  }

  Future<void> singOut(ctx) async {
    final shouldSignOut = await showDialog<bool>(
      context: ctx,
      builder: (context) {
        return AlertDialog(
          title: Text('Sign Out'),
          content: Text('Are you sure to exist'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text('NO')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text('YES'))
          ],
        );
      },
    );
    if (shouldSignOut == true){
      final _sharedPrefs = await SharedPreferences.getInstance();
      await _sharedPrefs.clear();

    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => const LoginPage()),
        (Route) => false);
    }
  }
}
