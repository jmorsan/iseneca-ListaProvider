import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iseneca/models/models.dart';
import 'package:iseneca/routes/app_routes.dart';
import 'package:iseneca/widgets/widgets.dart';

class AlumnadoCentroScreen extends StatelessWidget {
  const AlumnadoCentroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context)!.settings.arguments as User;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children:  [
          const Background(),
          OpcionesAlumnado(user:user),
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

class OpcionesAlumnado extends StatelessWidget {
  final User user;
  const OpcionesAlumnado({super.key, required this.user});

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
          CuadriculaOpciones(user:user)
        ],
      ),
    );
  }
}

class CuadriculaOpciones extends StatelessWidget {
  final User user;
  const CuadriculaOpciones({
    Key? key, required  this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          ),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Navigator.pushNamed(context, AppRoutes.menuOption[3].route,
                        arguments: user),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(
                          right: BorderSide(
                            color:Colors.grey,
                            width: 1.0 
                            ),
                            bottom: BorderSide(
                            color:Colors.grey,
                            width: 1.0 
                            ),
                          )
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Image(
                              image: AssetImage("assets/sombrero.png") ,
                              height: 50,
                              width: 50,
                              ),
                            Text(
                              "Alumnado \n Expulsados",
                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ) ,
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(
                          right: BorderSide(
                            color:Colors.grey,
                            width: 1.0 
                            ),
                            bottom: BorderSide(
                            color:Colors.grey,
                            width: 1.0 
                            ),
                          )
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Image(
                              image: AssetImage("assets/profesor.png") ,
                              height: 50,
                              width: 50,
                              ),
                            Text("Alumnado \n Convivencia",
                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



