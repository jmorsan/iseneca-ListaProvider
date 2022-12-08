import 'package:iseneca/models/models.dart';
import 'package:iseneca/providers/users_providers.dart';
import 'package:iseneca/themes/app_theme.dart';
import 'package:iseneca/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../routes/app_routes.dart';
import 'package:flutter/material.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children:  [
          const Background(),
          Profile(user:user),
        ]
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 35,
        selectedItemColor: const Color.fromRGBO(0, 82, 150, 1.000),
        unselectedItemColor: const Color.fromRGBO(164,164,164, 1),
        selectedFontSize: 12,
        unselectedFontSize: 11,
        onTap: (value) {
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Inicio'
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Agenda',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Comunicaciones',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menú',
          ),
        ],

      ),

    );
  }
}



class Profile extends StatelessWidget {
  final User user;
  const Profile({super.key, required this.user});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children:  [
          const SizedBox(height: 125),
          ProfileCard(user:user),
          Expanded(child: ProfileData(user:user)),
        ],
      ),
    );
  }
}

class ProfileData extends StatelessWidget {
  final User user;
  const ProfileData({super.key, required this.user});



  @override
  Widget build(BuildContext context) {
    final usersProvider = Provider.of<UsersProvider>(context, listen: true);
    return Expanded(
      child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        ),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: double.infinity,
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10, left: 10),
                child:    const Text(
                  'Perfil',
                  style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.w700 ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 20),
                child: const Icon(Icons.people,color: Colors.black,),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10, left: 10),
                child: Row(
                  children: [
                    const Text('Usuario: ',style:  TextStyle(fontSize: 18,color: Colors.blue,fontWeight: FontWeight.w700)),
                    Text(user.usuario,style: const TextStyle(fontSize: 18,color: Colors.black),),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 10),
                child: Row(
                  children: [
                    const Text('Nombre: ',style:  TextStyle(fontSize: 18,color: Colors.blue,fontWeight: FontWeight.w700)),
                    Text(user.nombreCompleto,style: const TextStyle(fontSize: 18,color: Colors.black),),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 10),
                child: Row(
                  children: [
                    const Text('Instituto: ',style:  TextStyle(fontSize: 18,color: Colors.blue,fontWeight: FontWeight.w700)),
                    Text(user.instituto,style: const TextStyle(fontSize: 18,color: Colors.black),),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  // ignore: deprecated_member_use
                  onTap: () =>launch('tel://${user.telefono}'),
                  child: Container(
                    decoration: const BoxDecoration(
                    color: Colors.blue,
                    border: Border(
                    right: BorderSide(
                      color:Colors.white,
                      width: 1.0 
                    )
                  )
                ),
                    height:50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(Icons.phone),
                        Text("Contacto"),
                      ],
                    ),
                  ),
                ),
              ),
              
              Expanded(
                child: GestureDetector(
                  // ignore: deprecated_member_use
                  onTap: () =>launch('mailto:${user.mail}'),
                  child: Container(
                    height:50,
                    color: Colors.blue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(Icons.mail),
                        Text("Correo"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ),
    );
  }
  
}

