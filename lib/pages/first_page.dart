import 'package:cubit/bloc/user/user_cubit.dart';
import 'package:cubit/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
        actions: [
          IconButton(
              onPressed: () {
                context.read<UserCubit>().deleteUser();
              },
              icon: Icon(Icons.delete_outline))
        ],
      ),
      body: BuildBody(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.accessibility_new),
          onPressed: () => Navigator.pushNamed(context, 'Page2')),
    );
  }
}

class BuildBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(builder: (context, state) {
      ///If a switch statement is preferred must be used state.runtimeType
      ///and cast the state as the desired inside
      if (state is UserInitial) {
        return Center(
          child: Text("No hay información del usuario",
              style: TextStyle(fontSize: 18.0)),
        );
      } else if (state is UserActive) {
        return UserInfo(user: state.user);
      } else {
        return Center(
            child: Text(
          'Ha ocurrido un error',
          style: TextStyle(fontSize: 18.0),
        ));
      }
    });
  }
}

class UserInfo extends StatelessWidget {
  final User user;

  const UserInfo({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('General',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ListTile(title: Text('Nombre: ${user.name}')),
          ListTile(title: Text('Edad: ${user.age}')),
          Text('Profesiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ...?user.jobs?.map((job) => ListTile(title: Text(job))).toList()
        ],
      ),
    );
  }
}
