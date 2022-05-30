import 'package:cubit/bloc/user/user_cubit.dart';
import 'package:cubit/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
              child: Text('Establecer Usuario',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                final user = User(name: 'Andrés Melenchón', age: 33, jobs: [
                  'Mobile Developer',
                  'KGB Double Agent',
                  'Aspiring Rockstar'
                ]);
                context.read<UserCubit>().selectUser(user);
              }),
          MaterialButton(
              child:
                  Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                context.read<UserCubit>().changeAge(30);
              }),
          MaterialButton(
              child: Text('Añadir Profesion',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                context.read<UserCubit>().addJob('Cubit Expert');
              }),
        ],
      )),
    );
  }
}
