import 'package:flutter/material.dart';
import 'package:movie_provider/data/providers/movie_provider.dart';
import 'package:movie_provider/data/repositories/dio_settings.dart';
import 'package:movie_provider/presentation/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MovieProvider(dio: DioSettings().dio),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData( 
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage()
      ),
    );
  }
}
