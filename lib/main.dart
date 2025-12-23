import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linterna/router/app_router.dart';

void main() {
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Linterna',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark
      ),
      routerConfig: appRouter,
    );
  }
}
