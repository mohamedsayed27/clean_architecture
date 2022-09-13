import 'package:clean_arch_ug/movies_module/core/services/services_locator.dart';
import 'package:clean_arch_ug/movies_module/movies/presentation/screens/movies_screen.dart';
import 'package:flutter/material.dart';

void main() async{

  ServicesLocator().init();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MoviesScreen(),
    );
  }
}
