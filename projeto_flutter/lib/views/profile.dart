import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      body: CardExample(),
    );
  }
}

class CardExample extends StatelessWidget {
  // const CardExample({super.key});

  List names = [  "Pedro",
                           "Robson",
                           "Rebeca",
                           "Camila",
                           "Dantoni",
                           "Matheus",
                           "Yasmin",
                           "Gustavo",
                           "Mariana",
                           "Eduarda" ];

  
  List jobs =     [  "Web Designer",
                           "Programmer",
                           "Developer",
                           "Project Manager",
                           "Data Scientist",
                           "Team Leader",
                           "Manager",
                           "Designer",
                           "Marketing Designer",
                           "Coder" ];
                           

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) => Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      //   Container(
                      //     width: 55.0,
                      //     height: 55.0,
                      //     child: const CircleAvatar(
                      //       backgroundColor: Colors.green,
                      //       foregroundColor: Colors.green,
                      //       backgroundImage: NetworkImage("https://api.multiavatar.com/Binx Bond.png"),
                      
                      //   ),
                      // ),
                      const SizedBox(width: 8.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                          Text(names[index], style: const TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold)),
                          Text(jobs[index], style: const TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    child: ElevatedButton(
                    onPressed: () {
                      // Ação a ser executada quando o botão for pressionado
                      print('Botão pressionado!');
                    },
                    child: Text('Detalhes'),
                  ),
                  ),
                ],
              ),
                
            )
          ),
        )
      ),
    );
  }
  

  // @override
  // Widget build(BuildContext context) {
  //   return Center(
  //     child: Card(
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: <Widget>[
  //           const ListTile(
  //             leading: AssetImage("images/logo.png"),
  //             title: Text('The Enchanted Nightingale'),
  //             subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
  //           ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.end,
  //             children: <Widget>[
  //               TextButton(
  //                 child: const Text('BUY TICKETS'),
  //                 onPressed: () {/* ... */},
  //               ),
  //               const SizedBox(width: 8),
  //               TextButton(
  //                 child: const Text('LISTEN'),
  //                 onPressed: () {/* ... */},
  //               ),
  //               const SizedBox(width: 8),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}

/* body: SingleChildScrollView(
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
      ), */