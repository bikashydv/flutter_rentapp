import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentui/home_page.dart';
import 'package:rentui/menu_page.dart';
import 'package:rentui/zoom_home_page.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EntryApp(),
    );
  }
}

class EntryApp extends StatefulWidget {
  const EntryApp({super.key});

  @override
  State<EntryApp> createState() => _EntryAppState();
}

class _EntryAppState extends State<EntryApp> with TickerProviderStateMixin {
  late MenuProvider menuController;
  @override
  void initState() {
    menuController = MenuProvider(
      vsync: this,
    )..addlistner(() => setState(() {}));
  }

  @override
  void dispose() {
    menuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>menuController,
      child: ZoomHomePage(
        menuScreen: MenuPage(),
        contentScreen:Layout(
          constentBuilder:(cc)=>HomePage(),
        )
      ),
    );
  }
}
