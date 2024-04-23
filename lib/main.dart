import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/config/app_theme.dart';
import 'package:to_do_app/presentation/providers/todo_List_provider.dart';
import 'package:to_do_app/presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TodoListProvider()),
      ],
      child: MaterialApp(
        title: 'To-Do App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme(colorTheme: 3).theme(),
        home: const MyHomePage(title: 'Welcome back!'),
      ),
    );
  }
}
