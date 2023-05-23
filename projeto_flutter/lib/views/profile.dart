import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  final String? userName;
  final String? email;
  final String? address;

  UserProfileScreen({
    this.userName,
    this.email,
    this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu Perfil'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          SizedBox(
            height: 100,
            width: 100,
            child: CircleAvatar(
              backgroundImage: AssetImage("images/avatar.jpg"),
            ),
          ),
          Text('Meu Perfil'),
        ],
      ),
    );
  }
}
