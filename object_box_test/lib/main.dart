import 'package:flutter/material.dart';
import 'package:object_box_test/objectbox.g.dart';

import 'entity/user.dart';

late Store store;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  store = await openStore();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ObjectBox Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ObjectBoxPage(),
    );
  }
}

class ObjectBoxPage extends StatefulWidget {
  const ObjectBoxPage({super.key});

  @override
  State<ObjectBoxPage> createState() => _ObjectBoxPageState();
}

class _ObjectBoxPageState extends State<ObjectBoxPage> {
  final userBox = store.box<User>();
  List<User> users = [];

  var _addUserController = TextEditingController();
  var _deleteUserController = TextEditingController();

  @override
  void initState() {
    super.initState();
    users = userBox.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ObjectBox')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              controller: _addUserController,
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {
                if (_addUserController.text.isNotEmpty) {
                  final user = User(name: _addUserController.text);
                  userBox.put(user);
                  setState(() {
                    users = userBox.getAll();
                  });
                }
              },
              child: const Text('ユーザーを追加する'),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text('データ全体'),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: users.length,
                itemBuilder: ((context, index) {
                  return Center(
                    child: Text(
                        'ID: ${users[index].id}, name: ${users[index].name}'),
                  );
                }),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            TextField(
              controller: _deleteUserController,
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {
                if (_deleteUserController.text.isNotEmpty &&
                    userBox.remove(int.parse(_deleteUserController.text))) {
                  setState(() {
                    users = userBox.getAll();
                  });
                }
              },
              child: const Text('IDが一致するユーザーを削除する'),
            ),
          ],
        ),
      ),
    );
  }
}
