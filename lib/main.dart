import 'package:cubit/bloc/user/user_cubit.dart';
import 'package:cubit/pages/second_page.dart';
import 'package:flutter/material.dart';

import 'package:cubit/pages/first_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => UserCubit())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'Page1',
        routes: {
          'Page1': (_) => FirstPage(),
          'Page2': (_) => SecondPage(),
        },
      ),
    );
  }
}
