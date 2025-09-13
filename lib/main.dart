import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/features/auth/cubit/auth_cubit.dart';
import 'package:project/features/onboarding/presentation/pages/splash_page.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider<AuthCubit>(create: (_) => AuthCubit())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SplashPage(),
    );
  }
}
