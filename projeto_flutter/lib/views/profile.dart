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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: CircleAvatar(
                backgroundImage: AssetImage("images/avatar.jpg"),
              ),
            ),
            Text('Meu Perfil'),
            ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) => const Divider(),
              itemCount: 20,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {},
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('images/icon.png'),
                      ),
                    ),
                  ),
                  title: Text('asdasdsad'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
