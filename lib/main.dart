import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nyobahive/layout/form_page.dart';

import 'layout/home_page.dart';
import 'model/contact.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized;
  await Hive.initFlutter();

  Hive.registerAdapter(ContactAdapter());

  await Hive.openBox<Contact>('dbContact');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FormPage(),
    );
  }
}
